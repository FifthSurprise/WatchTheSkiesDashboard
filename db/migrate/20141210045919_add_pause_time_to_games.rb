class AddPauseTimeToGames < ActiveRecord::Migration
  def change
    add_column :games, :pause_time, :datetime
  end
end
