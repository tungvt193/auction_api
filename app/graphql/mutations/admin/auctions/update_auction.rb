module Mutations
  module Admin
    module Auctions
      class UpdateAuction < BaseMutation
        argument :id, ID, required: true
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::AuctionType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])

          ApplicationRecord.transaction do
            encode_attributes = normalize_parameters(args[:attribute])
            attributes = decode_attributes(encode_attributes)

            resource.assign_attributes(attributes)
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(
            :id, :name, :display_name, :used_hours, :year_of_manufacture, :address,
            :min_price, :started_at, :ended_at, :status
          )
        end
      end
    end
  end
end
