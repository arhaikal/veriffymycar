class RentalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      redirect_to @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  def show
    @rental = Rental.find(params[:id])

    @documents = current_user.documents.where('valid_from < ? AND valid_until > ?', Date.today, Date.today)
  end

  private

  def rental_params
    params.require(:rental).permit(
      :pickup_location, :dropoff_location, :pickup_date, :dropoff_date, :vehicle_id, :user_id
      ) 
  end
end