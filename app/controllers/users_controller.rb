class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def index
      render json: User.all
    end

    def profile
      # byebug
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def finddriver 
      # byebug
      @user = current_user
      min_dist = Float::INFINITY
      @driver = nil
      User.all.each do |user|
         dist = distance_between(user.latitude.to_i,user.longitude.to_i,@user.latitude.to_i,@user.longitude.to_i)
         if dist < min_dist && user.id != @user.id
            @driver = user
            min_dist = dist
        end
      end
      render json: @driver
    end

    def distance_between(lat1, lon1, lat2, lon2)
      rad_per_deg = Math::PI / 180
      rm = 6371000 # Earth radius in meters
      lat1_rad, lat2_rad = lat1 * rad_per_deg, lat2 * rad_per_deg
      lon1_rad, lon2_rad = lon1 * rad_per_deg, lon2 * rad_per_deg
      a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))
      rm * c # Delta in meters
    end
  
    def create
      # byebug
      @user = User.create(name:params["username"],password:params["password"])
      if @user.valid?
        # byebug
        @token = encode_token({ user_id: @user.id })
        # byebug
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username,:password)
    end
  end 


  