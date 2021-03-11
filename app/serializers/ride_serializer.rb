class RideSerializer < ActiveModel::Serializer
    attributes :id, :pickup_location,:drop_location,:pickup_time,:vehicle_type,:customer,:driver, :item
      def customer
        ActiveModel::SerializableResource.new(object.customer,  each_serializer: UserSerializer)
      end

      def driver
        ActiveModel::SerializableResource.new(object.driver,  each_serializer: UserSerializer)
      end

      def item
        ActiveModel::SerializableResource.new(object.items,  each_serializer: ItemSerializer)
      end
  end

  