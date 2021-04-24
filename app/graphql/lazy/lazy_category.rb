module Lazy
  class LazyCategory < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:category_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Category.where(id: ids).each do |category|
          loader.call(category.try(:id)) { category }
        end
      end
    end
  end
end
