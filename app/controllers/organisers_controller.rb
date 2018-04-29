class OrganisersController < ApplicationController
  before_action :authenticate_organiser

  def index
    organisers = Organiser.all
    render json: organisers.as_json

  end

  def create
    org = Organiser.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if org.save
      render json: {message: "created successfully"}, status: :created
    else
      render json: {errors: org.errors.full_messages}, 
      status: :bad_request
    end
  end
end
