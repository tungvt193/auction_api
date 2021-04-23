module Resolvers
  module AuctionItems
    class Show < ::Resolvers::BaseResolver
      argument :id, ID, required: true
      type ::Types::AuctionItemType, null: false

      def resolve(id:)
        super
      end
    end
  end
end
