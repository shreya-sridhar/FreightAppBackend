class RidesController < ApplicationController
  # skip_before_action :authorized
  def index
    render json: Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(ride_params)
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
