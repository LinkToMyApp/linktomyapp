class AppLink < ActiveRecord::Base
	belongs_to :mobile_app
	has_many :link_clicks, :dependent => :destroy
	
	validates_presence_of :referal

	def self.clicks_by_date_and_referal(date, referals)
		AppLink.select("app_links.referal, count(link_clicks.id) AS link_clicks_count").where(:referal => referals).joins(:link_clicks).where("DATE(link_clicks.created_at) = ?", date).group("app_links.referal")
	end

	def self.installs_by_date_and_referal(date, referals)
		AppLink.select("app_links.referal, count(link_clicks.id) AS installs_count").where(:referal => referals).joins(:link_clicks).where("installed = TRUE AND DATE(link_clicks.created_at) = ?", date).group("app_links.referal")
	end
end
