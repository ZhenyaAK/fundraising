class Event < ApplicationRecord
  belongs_to :organiser
  has_many :attendees, through: :event_attendees

  def organiser
    Organiser.where(id: organiser_id)
  end
end
