module Resolvers
  module Common
    module AuctionItems
      class EstimatedPrice < ::Resolvers::BaseResolver
        argument :price, Float, required: true
        argument :unit, String, required: false
        argument :id, ID, required: true
        type ::Types::EstimatedPriceType, null: false

        def resolve(args)
          aui = super(id: args[:id])
          product = aui.try(:product)

          ::Estimated.estimate(product, args[:price], args[:unit])
        end

        private

        def model
          '::AuctionItem'
        end
      end
    end
  end
end
