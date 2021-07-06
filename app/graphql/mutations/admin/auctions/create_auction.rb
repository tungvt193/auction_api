module Mutations
  module Admin
    module Auctions
      class CreateAuction < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::AuctionType, null: false

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
            :name, :display_name, :used_hours, :year_of_manufacture, :address,
            :min_price, :started_at, :ended_at, :status, :color
          )
        end
      end
    end
  end
end
