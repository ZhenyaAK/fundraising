class AddPasswordToAttendees < ActiveRecord::Migration[5.1]
  def change
    add_column :attendees, :password_digest, :string
  end
end
