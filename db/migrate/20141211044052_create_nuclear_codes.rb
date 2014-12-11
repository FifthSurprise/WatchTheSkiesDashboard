class CreateNuclearCodes < ActiveRecord::Migration
  def change
    create_table :nuclear_codes do |t|

      t.timestamps
    end
  end
end
