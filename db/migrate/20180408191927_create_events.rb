class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_description
      t.string :event_date
      t.string :event_time
      t.string :event_address
      t.integer :organiser_id

      t.timestamps
    end
  end
end
