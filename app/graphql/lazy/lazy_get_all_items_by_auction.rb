module Lazy
  class LazyGetAllItemsByAuction < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: [], cache: true) do |ids, loader|
        ::AuctionItem.where(auction_id: ids).each do |auction_item|
          loader.call(auction_item.try(:auction_id)) { |memo| memo << auction_item }
        end
      end
    end
  end
end
