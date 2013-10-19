class Api::AppLinksController < ApplicationController

	respond_to :json

	def index
		@app_links = AppLink.all
		render json: @app_links
	end
end
