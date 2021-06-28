module Lazy
  class LazyOrderItems < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: [], cache: false) do |ids, loader|
        ::OrderItem.where(order_id: ids).each do |order_item|
          loader.call(order_item.try(:order_id)) { |memo| memo << order_item }
        end
      end
    end
  end
end
