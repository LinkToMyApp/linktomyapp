class AddIndexToForeignKeys < ActiveRecord::Migration
  def change
  	add_index :app_links, :mobile_app_id
  	add_index :link_clicks, :app_link_id
  end
end
