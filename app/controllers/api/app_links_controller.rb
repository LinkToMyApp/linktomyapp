class Api::AppLinksController < ApplicationController

	respond_to :json

	def index
		@app_links = AppLink.all
		render json: @app_links
	end

	def clicks
		unique_dates = LinkClick.order("DATE(created_at)").group("DATE(created_at)").count.map {|a|a[0]}

		result = {}
		@clicks = unique_dates.map { |date|
			result[date]=AppLink.select("app_links.referal, count(link_clicks.id) AS link_clicks_count").joins(:link_clicks).where("DATE(link_clicks.created_at) = ?", date).group("app_links.referal")
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
	      link_click_id=link_click.id
	    end
	    
	    render :json => {:link_click_id => link_click_id }
	  end
end
