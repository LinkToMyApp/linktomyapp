class WelcomeController < ApplicationController
	def index
  		render :file => 'public/app/index.html' and return
	end
end
