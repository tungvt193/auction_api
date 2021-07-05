module Mutations
  module Common
    module Bookings
      class CreateBooking < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::BookingType, null: false

        def resolve(args)
          super

          resource = collection.new({
                                      user_id: current_user.try(:id)
                                    })

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)
            resource.deposit = resource.try(:auction).try(:price).to_f * 0.3

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :auction_item_id, :auction_id, :booking_type, :address,
            :zoom_id, :zoom_password, :supporter_id, :booking_at,
            :deposit_type, :payment_type, :price
          )
        end
      end
    end
  end
end
