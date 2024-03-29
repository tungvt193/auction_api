module Lazy
  class LazyAuctionItem < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:auction_item_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::AuctionItem.where(id: ids).each do |auction_item|
          loader.call(auction_item.try(:id)) { auction_item }
        end
      end
    end
  end
end
