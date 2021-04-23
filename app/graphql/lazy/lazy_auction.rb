module Lazy
  class LazyAuction < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:auction_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Auction.where(id: ids).each do |auction, _v|
          loader.call(auction.try(:id)) { auction }
        end
      end
    end
  end
end
