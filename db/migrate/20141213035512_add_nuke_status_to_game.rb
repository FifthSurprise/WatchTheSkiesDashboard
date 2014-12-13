class AddNukeStatusToGame < ActiveRecord::Migration
  def change
    add_column :games, :nuclear_launch, :boolean, default: false

  end
end
