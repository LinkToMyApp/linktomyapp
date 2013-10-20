class AddCallBackToMobileApp < ActiveRecord::Migration
  def change
  	add_column :mobile_apps, :callback_url, :string
  end
end
