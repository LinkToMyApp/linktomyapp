class CreateMobileApps < ActiveRecord::Migration
  def change
    create_table :mobile_apps do |t|
      t.string :name,		:null => false
      t.string :itunes_url,	:null => false
      t.string :icon_url,	:null => false

      t.timestamps
    end
  end
end
	