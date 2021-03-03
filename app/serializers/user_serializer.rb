class UserSerializer < ActiveModel::Serializer
  attributes :id,:name, :address,:email,:wallet,:driver_star_rating,:customer_star_rating,:status,:is_driver,:vehicle_type,:vehicle_number,:password_digest, :latitude, :longitude
end
