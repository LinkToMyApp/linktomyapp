class LinkClick < ActiveRecord::Base
	belongs_to :app_link, :counter_cache => true
	
	validates_presence_of :ip_adress
end
