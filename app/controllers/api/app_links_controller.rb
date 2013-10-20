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
		unique_dates = LinkClick.dates_by_referal(params[:referals])

		app_links = {}
		@clicks = unique_dates.map { |date|
			app_links[date] = AppLink.clicks_by_date_and_referal(date, params[:referals])
		}

		render json: app_links
	end

	def installs
		unique_dates = LinkClick.dates_by_referal(params[:referals])

		result = {}
		@clicks = unique_dates.map { |date|
			result[date] = AppLink.installs_by_date_and_referal(date, params[:referals])
		}
		render json: result
	end

	def app_installed
		link_click = LinkClick.where(:installed => false, :ip_adress => request.remote_ip, :app_link_id => AppLink.where(:mobile_app_id => params[:app_id])).order("created_at DESC").first

		if link_click.nil?
			link_click_id=SecureRandom.hex(8)
		else
			link_click.update_attributes(:installed => true)
			AppLink.increment_counter(:installs_count, link_click.app_link.id)
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
