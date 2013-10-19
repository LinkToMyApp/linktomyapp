class MobileApp < ActiveRecord::Base
	has_many :app_links, :dependent => :destroy

	validates_presence_of :name, :itunes_url, :icon_url
end
