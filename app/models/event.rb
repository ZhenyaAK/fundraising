class Event < ApplicationRecord
  belongs_to :organiser
  has_many :attendees, through: :event_attendees

  def as_json
    { 
      id: id,
      event_name: event_name,
      event_description: event_description,
      event_date: event_date,
      event_time: event_time,
      event_location: event_location
    }
  
  end 
  def organiser
    Organiser.where(id: organiser_id)
  end
end
