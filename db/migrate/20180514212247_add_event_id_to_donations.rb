class AddEventIdToDonations < ActiveRecord::Migration[5.1]
  def change
    remove_column :donations, :item, :string
    remove_column :donations, :quantity, :string
  end
end
