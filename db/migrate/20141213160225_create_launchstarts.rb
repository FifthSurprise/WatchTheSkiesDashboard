class CreateLaunchstarts < ActiveRecord::Migration
  def change
    create_table :launchstarts do |t|
      t.boolean :value
      t.timestamps
    end
  end
end
