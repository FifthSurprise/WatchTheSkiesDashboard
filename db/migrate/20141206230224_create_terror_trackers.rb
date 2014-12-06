class CreateTerrorTrackers < ActiveRecord::Migration
  def change
    create_table :terror_trackers do |t|
      t.string :description
      t.integer :amount
      t.timestamps
    end
  end
end
