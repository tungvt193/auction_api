module Lazy
  class LazyEstimatedPrice < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:product_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Product.where(id: ids).each do |product|
          loader.call(product.try(:id)) { ::Estimated.estimate(product, obj.try(:price)) }
        end
      end
    end
  end
end
