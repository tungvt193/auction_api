module Mutations
  module Common
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
            resource.address = '18 Tôn Thất Thuyết, Mỹ Đình, Cầu Giấy, Hà Nội' if resource.try(:is_default_address?)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :auction_item_id, :booking_type, :address,
            :zoom_id, :zoom_password, :supporter_id, :booking_at,
            :deposit_type, :payment_type, :price, :status
          )
        end
      end
    end
  end
end
