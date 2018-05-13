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
      event_address: event_address, 
      tagline: tagline,
      details1: details1,
      foundation_url: foundation_url,
      img_url: img_url

    }
  
  end 
  def organiser
    Organiser.where(id: organiser_id)
  end
end
