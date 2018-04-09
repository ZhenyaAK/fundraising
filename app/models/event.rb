class Event < ApplicationRecord
  belongs_to :organiser
  has_many :attendees, through :event_attendees
end
