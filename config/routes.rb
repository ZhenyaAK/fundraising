Rails.application.routes.draw do

  #post 'organiser_token' => 'organiser_token#create'
  #organiser create route
  post '/organisers' =>'organisers#create'

end
