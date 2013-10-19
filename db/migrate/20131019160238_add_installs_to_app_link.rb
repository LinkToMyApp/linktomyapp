class AddInstallsToAppLink < ActiveRecord::Migration
  def change
  	add_column :app_links, :installs_counter, :integer, :null => false, :default => 0
  	rename_column :app_links, :clicks_counter, :link_clicks_count
  	rename_column :app_links, :installs_counter, :installs_count
  end
end
