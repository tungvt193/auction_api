module Lazy
  class LazyProductTotal < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::Product.where(category_id: ids).group_by(&:category_id).each do |category_id, v|
          loader.call(category_id) { v.size.to_i }
        end
      end
    end
  end
end
