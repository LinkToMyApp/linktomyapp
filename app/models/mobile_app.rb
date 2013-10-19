class MobileApp < ActiveRecord::Base
	has_one :app_link, :dependent => :destroy

	validates_presence_of :name, :itunes_url, :icon_url
end
