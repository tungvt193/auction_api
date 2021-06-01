module Resolvers
  module Common
    module Auctions
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::AuctionType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
