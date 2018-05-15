class ChangeDataTypeOnDonations < ActiveRecord::Migration[5.1]
  def change
    change_column :donations, :amount, :integer
  end
end
