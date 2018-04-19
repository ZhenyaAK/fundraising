class RemoveAttendeeIdFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :attendee_id, :integer
  end
end
