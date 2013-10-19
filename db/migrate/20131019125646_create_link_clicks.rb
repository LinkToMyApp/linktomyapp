class CreateLinkClicks < ActiveRecord::Migration
  def change
    create_table :link_clicks do |t|
      t.integer :app_link_id
      t.string :ip_adress
      t.integer :occurence_counter
      t.boolean :installed

      t.timestamps
    end
  end
end
