module Lazy
  class LazyProduct < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:product_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::Product.where(id: ids).each do |product|
          loader.call(product.try(:id)) { product }
        end
      end
    end
  end
end
