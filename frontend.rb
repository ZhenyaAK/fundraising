require 'unirest'

#make a new user/organiser
# response = Unirest.post("http://localhost:3000/organisers", 
#   parameters: {
   
#     name: "x",
#     email_address: "x@gmail.com",
#     password: "passwordX",

#   }
#   )
# # p response.body

# # see all events
# response = Unirest.get("http://localhost:3000/events")
# p response.body


# #see a specific event
# # response = Unirest.get("http://localhost:3000/events#{input_id}")
# # p response.body

# #create an event
# p "Enter an Event Name: Cause"
# event_name = gets.chomp

# p "Event Description"
# event_description = gets.chomp

# p "Event Date"
# event_date = gets.chomp

# p "Event Time"
# event_time = gets.chomp

# p"Event address"
# event_address = gets.chomp
# response = Unirest.get("http://localhost:3000/events",
#   parameters: {

#     event_name: event_name,
#     event_date: event_date
#   }

#   )
# p response.body

#update an event ???
p "To update an Event please Enter Event number"
input_id = gets.chomp

response = Unirest.get("http://localhost:3000/events/#{input_id}")
p response.body

user_params = {}

p "Your event name is #{response.body["event_name"]}"
user_params[:event_name] = gets.chomp

p "Event Description (#{response.body["event_description"]}) :"
user_params[:event_description] = gets.chomp

p "Event Date (#{response.body["event_date"]}) :"
user_params[:event_date] = gets.chomp

p "Event Name (#{response.body["event_time"]}) :"
user_params[:event_time] = gets.chomp

p "Event Name (#{response.body["event_address"]}) :"
user_params[:event_address] = gets.chomp

#delete event ?? 
response = Unirest.delete("http://localhost:3000/events/#{input_id}")
p response.body
