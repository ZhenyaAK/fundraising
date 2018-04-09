class CreateEventOrganisers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_organisers do |t|
      t.integer :event_id
      t.integer :organiser_id

      t.timestamps
    end
  end
end
