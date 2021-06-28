module Lazy
  class LazyOrder < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:order_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Order.where(id: ids).each do |order|
          loader.call(order.try(:id)) { order }
        end
      end
    end
  end
end
