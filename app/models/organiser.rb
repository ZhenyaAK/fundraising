class Organiser < ApplicationRecord
  has_many :events
  #has_many :charities
  has_secure_password
  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true

 def events
  Event.where(organiser_id: id)
 end 

end
