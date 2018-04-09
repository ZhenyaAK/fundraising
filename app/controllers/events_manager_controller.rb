class EventsManagerController < ApplicationController
  
  def index
  #show all events
  #get all events from the db
  event = Event.all.order(:id)

  
  #show to user
  render json: event.as_json
  end 

  def create
    event = Event.new(
      event_name: params[:event_name],
      event_description: params[:event_description],
      event_date: params[:event_date],
      event_time: params[:event_time],
      event_address: params[:event_address]

      )

  end

end
