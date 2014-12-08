class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :current_round
      t.datetime :next_round
      t.boolean :paused
      t.timestamps
    end
  end
end
