class Event < ApplicationRecord
  belongs_to :organiser
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
  has_many :donations


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
      details2:details2,
      foundation_url: foundation_url,
      img_url: img_url,
      total_donation: calculate_donation_amount,
      total_attendees: event_attendees.length

    }
  
  end 
  def organiser
    Organiser.where(id: organiser_id)
  end

   def calculate_donation_amount

     total = 0
     donations.each do |donation|
       total += donation.amount
     
       p donation.amount
       
     end
     total
   end

   
end
