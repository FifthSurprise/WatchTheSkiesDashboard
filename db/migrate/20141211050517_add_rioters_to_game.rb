class AddRiotersToGame < ActiveRecord::Migration
  def change
    add_column :games, :rioters, :integer
  end
end
