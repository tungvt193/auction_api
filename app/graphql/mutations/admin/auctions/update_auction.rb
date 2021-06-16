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
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :id, :name, :display_name, :used_hours, :year_of_manufacture, :address,
            :min_price, :started_at, :ended_at, :status
          )
        end
      end
    end
  end
end
