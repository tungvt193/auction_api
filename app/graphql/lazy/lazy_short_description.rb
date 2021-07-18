module Lazy
  class LazyShortDescription < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:product_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::Product.where(id: ids).each do |product|
          loader.call(product.try(:id)) { product.try(:short_description) }
        end
      end
    end
  end
end
