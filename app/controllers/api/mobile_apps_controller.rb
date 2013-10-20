class Api::MobileAppsController < ApplicationController
	respond_to :json

	def show
		@mobile_app = MobileApp.first
		render json: @mobile_app
	end
end
