class CreateAppLinks < ActiveRecord::Migration
  def change
    create_table :app_links do |t|
      t.integer :mobile_app_id,				:null => false
      t.string :referal,					:null => false
      t.integer :clicks_counter,			:null => false, :default => 0
      t.integer :unique_visitor_counter,	:null => false, :default => 0

      t.timestamps
    end
  end
end
