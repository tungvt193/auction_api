module Mutations
  module Admin
    module Orders
      class CreateOrder < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::OrderType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :code, :cod_code, :status, :user_id, :payment_type,
            :price, :tax, :booking_at,
            order_items_attributes: %i[
              id auction_item_id auction_id product_id
              price status quantity _destroy
            ]
          )
        end
      end
    end
  end
end
