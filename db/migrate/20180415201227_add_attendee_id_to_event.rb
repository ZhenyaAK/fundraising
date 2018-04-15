class AddAttendeeIdToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :attendee_id, :integer

  end
end
