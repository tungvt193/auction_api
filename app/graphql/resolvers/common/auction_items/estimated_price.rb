module Resolvers
  module Common
    module AuctionItems
      class EstimatedPrice < ::Resolvers::BaseResolver
        argument :price, Float, required: true
        type ::Types::EstimatedPriceType, null: false

        def resolve(price:)
          Rails.logger.info("price----------> #{price}")

          ::OpenStruct.new({
                             entrust_fee: 0,
                             japan_port_fee: 0,
                             release_fee: 0,
                             import_tax: 0,
                             vat_tax: 0
                           })
        end
      end
    end
  end
end
