class Attendee < ApplicationRecord
  has_many :events, through: :event_attendees
  has_many :donations
end
