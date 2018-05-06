class EventsManagerController < ApplicationController
  
  def index
  #show all events
  #get all events from the db
  event = Event.all.order(:id)
   p "*****************"
    p current_organiser
    p "**********"

  
  #show to user
  render json: event.as_json
  end 

  def show
    event = Event.find_by(id: params[:id])
    render json: event.as_json

  end

  def create
    p "*****************"
    p current_organiser
    p "**********"
    event = Event.new(
      event_name: params[:event_name],
      event_description: params[:event_description],
      event_date: params[:event_date],
      event_time: params[:event_time],
      event_address: params[:event_address], 
      organiser_id: current_organiser.id

      )
    if event.save
      render json: event.as_json
    else 
      render json: {errors: event.errors.full_messages}, status: :unprocessible_entity
    end

  end

  def update
    event = Event.find_by(id: params[:id])

    event.update( event_name: params[:event_name],
    event_description: params[:event_description],
    event_date: params[:event_date],
    event_time: params[:event_time],
    event_address: params[:event_address]
    )
    if event.save
      render json: event.as_json
    else 
      render json: {errors: event.errors.full_messages}
    end 
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    render json: {message: "Your entry deleted"}

  end

end
