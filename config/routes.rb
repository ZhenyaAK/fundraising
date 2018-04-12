Rails.application.routes.draw do

  #post 'organiser_token' => 'organiser_token#create'
  #organiser create route
  post '/organisers' =>'organisers#create'
  #all events
  get '/events' =>'events_manager#index'
  #an event
  get '/events/:id' =>'events_manager#show'
  #create an event
  post '/events' => 'events_manager#create'
  #update
  patch '/events/:id'=> 'events_manager#update'
  #delete
  delete 'events/:id' => 'events_manager#destroy'

end
