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
			result[date]=AppLink.select(:referal, :link_clicks_count).joins(:link_clicks).where("DATE(link_clicks.created_at) = ?", date)
		}

		render json: result
	end
end
