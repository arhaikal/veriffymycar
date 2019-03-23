class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      redirect_to controller: 'users', action: 'new', rental_id: @rental.id
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(
      :pickup_location, :dropoff_location, :pickup_date, :dropoff_date, :vehicle_id
      ) 
  end
end