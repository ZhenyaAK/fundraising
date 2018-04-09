class OrganisersController < ApplicationController
  def create
    org = Organiser.new(
      name: params[:name],
      email_address: params[:email_address],
      password: params[:password]
      #password_confirmation params[:password_confirmation]
      )
    if org.save
      render json: {message: "created successfully"}, status: :created
    else
      render json: {errors: org.errors.full_messages}, 
      status: :bad_request
    end
  end
end
