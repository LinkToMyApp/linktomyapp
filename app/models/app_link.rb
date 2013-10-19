class AppLink < ActiveRecord::Base
	belongs_to :mobile_app
	has_many :link_clicks, :dependent => :destroy
	
	validates_presence_of :referal
end
