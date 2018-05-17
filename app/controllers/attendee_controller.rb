class AttendeeController < ApplicationController

  def create
    attendee = Attendee.new(
      attendee_name: params[:attendee_name],
      attendee_email: params[:attendee_email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      volunteer: params[:volunteer]
      )
    if attendee.save
      render json: {message: "created successfully"}, status: :created
    else
      render json: {errors: attendee.errors.full_messages}, 
      status: :bad_request
    end
  end
end

