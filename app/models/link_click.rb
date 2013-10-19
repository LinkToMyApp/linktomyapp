class LinkClick < ActiveRecord::Base
	belongs_to :app_link
	validates_presence_of :ip_adress
end
