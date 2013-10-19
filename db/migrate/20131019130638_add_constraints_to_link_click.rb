class AddConstraintsToLinkClick < ActiveRecord::Migration
  def change
  	change_column :link_clicks, :app_link_id,		:integer, :null => false
  	change_column :link_clicks, :ip_adress, 		:string, :null => false
  	change_column :link_clicks, :occurence_counter,	:integer, :null => false, :default => 0
  	change_column :link_clicks, :installed, 		:boolean, :default => false
  end
end
