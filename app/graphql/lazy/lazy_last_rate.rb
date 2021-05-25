module Lazy
  class LazyLastRate < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Rate.where(ratable_type: 'AuctionItem', auction_id: ids).group_by(&:auction_id).each do |_k, v|
          loader.call(v.last.try(:auction_id)) { v.last }
        end
      end
    end
  end
end
