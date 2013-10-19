class AddColumnUserAgentToLinkClick < ActiveRecord::Migration
  def change
  	add_column :link_clicks, :user_agent, :string
  end
end
