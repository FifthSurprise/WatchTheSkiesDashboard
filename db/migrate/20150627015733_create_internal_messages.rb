class CreateInternalMessages < ActiveRecord::Migration
  def change
    create_table :internal_messages do |t|
      t.string :message
      t.string :author
      t.timestamps
    end
  end
end
