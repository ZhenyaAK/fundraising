require 'unirest'

#make a new user/organiser
# response = Unirest.post("http://localhost:3000/organisers", 
#   parameters: {
   
#     name: "x",
#     email_address: "x@gmail.com",
#     password: "passwordX",

#   }
#   )
# p response.body

# see all events
response = Unirest.get("http://localhost:3000/events")
p response.body


#see a specific event
response = Unirest.get("http://localhost:3000/events#{input_id}")
p response.body

#create an event
#p "Enter an Event Name: Cause"
#event_name = gets.chomp

#p "Event Description"
#event_description = gets.chomp

#p "Event Date"
#event_date = gets.chomp

#p "Event Time"
#event_time = gets.chomp

#p"Event address"
#event_address = gets.chomp
# response = Unirest.get("http://localhost:3000/events",
#   parameters: {

#     event_name: event_name
#     event_date: event_date
#   }

#   )
# p response.body