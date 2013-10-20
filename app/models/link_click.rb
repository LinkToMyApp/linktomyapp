class LinkClick < ActiveRecord::Base
	belongs_to :app_link, :counter_cache => true
	
	validates_presence_of :ip_adress, :user_agent

	scope :recents, -> { order('created_at DESC') }

	def self.dates_by_referal(referals)
		LinkClick.joins(:app_link).where(:app_links => {:referal => referals}).order("DATE(link_clicks.created_at)").group("DATE(link_clicks.created_at)").count.map {|result| result[0]}
	end
end
