class FixColumnNametoEmail < ActiveRecord::Migration[5.1]
  def change
    rename_column :organisers, :email_address, :email
  end
end
