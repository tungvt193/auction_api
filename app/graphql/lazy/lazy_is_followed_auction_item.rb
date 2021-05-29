module Lazy
  class LazyIsFollowedAuctionItem < Base
    def call(obj, _args, ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: false, cache: false) do |ids, loader|
        ::Follower.where(user_id: ctx[:current_user].try(:id), followable_type: 'AuctionItem', followable_id: ids).each do |auction_item|
          loader.call(auction_item.try(:followable_id)) { true }
        end
      end
    end
  end
end
