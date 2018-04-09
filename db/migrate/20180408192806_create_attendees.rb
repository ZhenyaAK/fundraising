class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.string :attendee_name
      t.string :attendee_email
      t.boolean :volunteer, default: false

      t.timestamps
    end
  end
end
