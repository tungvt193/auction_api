module Mutations
  module Admin
    module Bookings
      class UpdateBooking < BaseMutation
        argument :id, ID, required: true
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::BookingType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.permit(
            :auction_item_id, :auction_id, :status, :user_id,
            :booking_type, :address, :zoom_id, :zoom_password,
            :supporter_id, :booking_at, :canceled_reason
          )
        end
      end
    end
  end
end
