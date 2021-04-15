module Mutations
  module AuctionUsers
    class DeleteAuctionUser < BaseMutation
      argument :id, ID, required: true
      field :data, ::Types::AuctionUserType, null: false

      def resolve(args)
        super

        resource = object_from_id(args[:id])
        resource.destroy!

        { data: resource }
      end
    end
  end
end
