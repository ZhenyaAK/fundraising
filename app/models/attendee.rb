class Attendee < ApplicationRecord
  has_many :events, through: :event_attendees
  has_many :donations
  has_secure_password
  # validates :attendee_name, presence: true
  # validates :attendee_email, presence: true, uniqueness: true
end
