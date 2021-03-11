class RideSerializer < ActiveModel::Serializer
    attributes :pickup_location,:drop_location,:pickup_time,:vehicle_type,:customer,:driver
      def customer
        ActiveModel::SerializableResource.new(object.customer,  each_serializer: UserSerializer)
      end

      def driver
        ActiveModel::SerializableResource.new(object.driver,  each_serializer: UserSerializer)
      end
  end

  