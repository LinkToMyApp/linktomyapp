require "uri"
require "net/http"

class Api::AppLinksController < ApplicationController
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def index
		@app_links = AppLink.all
		render json: @app_links
	end

	def clicks
		unique_dates = LinkClick.joins(:app_link).where(:app_links => {:referal => params[:referals]}).order("DATE(link_clicks.created_at)").group("DATE(link_clicks.created_at)").count.map {|a|a[0]}

		result = {}
		@clicks = unique_dates.map { |date|
			result[date]=AppLink.select("app_links.referal, count(link_clicks.id) AS link_clicks_count").where(:referal => params[:referals]).joins(:link_clicks).where("DATE(link_clicks.created_at) = ?", date).group("app_links.referal")
		}

		render json: result
	end

	def installs
		unique_dates = LinkClick.joins(:app_link).where(:app_links => {:referal => params[:referals]}).order("DATE(link_clicks.created_at)").group("DATE(link_clicks.created_at)").count.map {|a|a[0]}

		result = {}
		@clicks = unique_dates.map { |date|
			result[date]=AppLink.select("app_links.referal, count(link_clicks.id) AS installs_count").where(:referal => params[:referals]).joins(:link_clicks).where("installed = TRUE AND DATE(link_clicks.created_at) = ?", date).group("app_links.referal")
		}
		render json: result
	end

	def app_installed
		link_clicks = LinkClick.where(:installed => false, :ip_adress => request.remote_ip, :app_link_id => AppLink.where(:mobile_app_id => params[:app_id])).order("created_at DESC")

		if link_clicks.blank?
			link_click_id=SecureRandom.hex(8)
		else
			link_click = link_clicks.first
			link_click.update_attributes(:installed => true)
			link_click.app_link.installs_count += 1
			link_click.app_link.save
			link_click_id=link_click.id
		end

		render :json => {:link_click_id => link_click_id }
	end

	def event
	  #Todo call assynchrone
	  link_click = LinkClick.where(:id => params[:id]).first

	  if link_click.present?
	  	mobile_app = MobileApp.first
	  	if mobile_app.callback_url.present?
	  		url = URI.parse mobile_app.callback_url
	  		req = Net::HTTP::Post.new url.path
	  		req.set_form_data({:event => params[:event] , :referal => link_click.app_link.referal})
	  		res = Net::HTTP.start(url.host, url.port) do |http|
	  			http.request req
	  		end
	  	end
	  end

	  render :json => {}
	end
end
