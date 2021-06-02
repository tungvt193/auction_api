module Mutations
  module Mobile
    module AuctionItemUsers
      class CreateAuctionItemUser < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::AuctionItemUserType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters).merge({
                                                                      user_id: current_user.try(:id)
                                                                    })

            resource.assign_attributes(attributes)
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.permit(:auction_item_id)
        end
      end
    end
  end
end
