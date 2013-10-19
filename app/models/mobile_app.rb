class MobileApp < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :itunes_url
	validates_presence_of :icon_url
end
