class AppLink < ActiveRecord::Base
	has_many :link_clicks, :dependent => :destroy
	
	validates_presence_of :referal
end
