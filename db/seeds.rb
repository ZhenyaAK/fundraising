# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#attendees
# Faker::Name.name
# Faker::Internet.free_email
# Faker::Internet.password(8)
# Faker::Boolean.boolean(0.1)
# create attendees data
# 100.times do
#   Attendee.create!(
#     attendee_name: Faker::Name.name,
#     attendee_email: Faker::Internet.free_email,
#     password_digest: Faker::Internet.password(8),
#     volunteer: Faker::Boolean.boolean(0.1)
#     )
# end

#create organisers:
#  10.times do 
#   Organiser.create!(
#     name: Faker::Name.name,
#     email: Faker::Internet.free_email,
#     password_digest: Faker::Internet.password(8)
#     )
# end

# add donations:

# 100.times do
#   Donation.create!(
#     event_id: rand(3...10),
#     amount: rand(10...1000)
#     )
# end

# populate event_attendee table
 

     20.times do
      EventAttendee.create!(
        event_id: rand(3...10),
        attendee_id: rand(1...100)

        )
      end
