class RidesController < ApplicationController
  # skip_before_action :authorized
  def index
    render json: Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    bill = 100*distance_between(params["start_lat"],params["start_lng"],params["end_lat"],params["end_lng"])
    @ride = Ride.create(pickup_location: params["pickup_location"],
    drop_location: params["drop_location"],
    pickup_time: params["pickup_time"],
    vehicle_type: params["vehicle_type"],
    driver_id: params["driver"]["id"],
    customer_id: params["customer"]["id"])
    actual_bill:bill
    @ride.save
    render json: @ride
  end

  def show
    @ride = Ride.find_by(id: params[:id])
    render json: @ride
  end

  def update
    @ride = Ride.find(params[:id])
    @ride.update_attributes(params[:status])
  end

  private

  def ride_params
    params.require(:Ride).permit(:user_id, :status, :total_sum)
  end
end
