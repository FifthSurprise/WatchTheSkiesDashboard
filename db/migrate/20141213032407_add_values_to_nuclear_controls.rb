class AddValuesToNuclearControls < ActiveRecord::Migration
  def change
    add_column :nuclear_codes, :country, :string
    add_column :nuclear_codes, :codeA, :string
    add_column :nuclear_codes, :codeB, :string
    add_column :nuclear_codes, :target, :string
    add_column :nuclear_codes, :country_flag, :string, default: "flag_"
  end
end
