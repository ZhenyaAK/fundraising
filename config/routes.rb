Rails.application.routes.draw do

  #post 'organiser_token' => 'organiser_token#create'
  #organiser create route
  post '/organisers' =>'organisers#create'
  #all events
  get '/events' =>'eventsmanager#index'
  #an event
  # get '/events/:id' =>'eventsmanager#show'
  # #create an event
  # post '/events' => 'eventsmanager#create'
  # #update
  # patch '/events'=> 'eventsmanager#update'
  # #delete
  # delete 'events' => 'eventsmanager#destroy'

end
