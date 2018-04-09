class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.string :item
      t.string :quantity
      t.string :amount
      t.integer :event_id

      t.timestamps
    end
  end
end
