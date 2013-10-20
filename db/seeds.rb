def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

referals = ["facebook.com","tweeter.com","techcrunch.com","rudebaguette.com","adNetwork.com"]

puts "Create Youboox App..."
MobileApp.destroy_all
mobile_app = MobileApp.create(:name => "Youboox", 
	:itunes_url => "https://itunes.apple.com/fr/app/youboox-lacces-gratuit-aux/id480514565?mt=8", 
	:icon_url => "http://a4.mzstatic.com/us/r30/Purple/v4/ff/42/bb/ff42bbec-132d-3722-6218-bec51eb43e5e/mzl.clfucble.175x175-75.jpg",
	:callback_url => "http://mighty-basin-2906.herokuapp.com/users/track")
puts "Done!"

5.times do |i|
	puts "Create App Link ..."
	rand_click = rand(40)
	app_link = AppLink.create!(:mobile_app_id => mobile_app.id,
		:referal => referals[i],
		:link_clicks_count => rand_click,
        :installs_count => (rand_click/2).to_i,
		:unique_visitor_counter => rand_click)
	puts "Done !"

	rand_click.times do
		puts "Create Link click ..."
		LinkClick.create!(:app_link_id => app_link.id,
			:ip_adress => Faker::Internet.ip_v4_address,
			:occurence_counter => rand(3),
			:installed => [true, false].sample,
			:created_at => rand_time(7.days.ago),
			:user_agent => "azerty")
		puts "Done !"
	end
end

