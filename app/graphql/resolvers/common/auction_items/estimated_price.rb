module Resolvers
  module Common
    module AuctionItems
      class EstimatedPrice < ::Resolvers::BaseResolver
        argument :price, Float, required: true
        argument :id, ID, required: true
        type ::Types::EstimatedPriceType, null: false

        def resolve(id:, price:)
          aui = super
          product = aui.try(:product)

          Estimated.estimate(product, price)
        end
      end
    end
  end
end
