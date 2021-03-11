class ItemsController < ApplicationController
    
  def show 
    @item = Item.find(params[:id])
    render json: @item
  end

  def index 
    render json: Item.all
  end

  def new
    @item = Item.new
  end

  def create 
    byebug 
    @item = Item.create(description:params["description"],
    ride_id:params["ride_id"])
    @item.save
    byebug
    render json: @item
  end

end