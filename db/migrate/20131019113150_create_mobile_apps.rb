class CreateMobileApps < ActiveRecord::Migration
  def change
    create_table :mobile_apps do |t|
      t.string, :name
      t.string, :itunes_url
      t.string :icon_url

      t.timestamps
    end
  end
end
