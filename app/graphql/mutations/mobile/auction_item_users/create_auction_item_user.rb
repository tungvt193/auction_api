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
            encode_attributes = normalize_parameters(args[:attribute])
            attributes = decode_attributes(encode_attributes).merge({
                                                                      user_id: current_user.try(:id)
                                                                    })

            resource.assign_attributes(attributes)
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(
            :auction_item_id
          )
        end
      end
    end
  end
end