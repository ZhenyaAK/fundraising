Rails.application.routes.draw do

 post 'organiser_token' => 'organiser_token#create'
  #organiser create route
  get '/organisers' => 'organisers#index'
  post '/organisers' =>'organisers#create'
  #all events
  get '/events' =>'events_manager#index'
  #events posted by an organiser
  get '/organiserevents' => 'events_manager#organiser_events_index'
  #an event
  get '/events/:id' =>'events_manager#show'
  #create an event
  post '/events' => 'events_manager#create'

  post '/attendees' => 'attendee#create'


  #update
  patch '/events/:id'=> 'events_manager#update'
  #delete
  delete '/events/:id' => 'events_manager#destroy'

end
