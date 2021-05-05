module Mutations
  module Mobile
    module AuctionItemUsers
      class DeleteAuctionItemUser < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::AuctionItemUserType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])
          resource.destroy!

          { data: resource }
        end
      end
    end
  end
end
