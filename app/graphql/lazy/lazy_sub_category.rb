module Lazy
  class LazySubCategory < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:sub_category_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::SubCategory.where(id: ids).each do |sub_category|
          loader.call(sub_category.try(:id)) { sub_category }
        end
      end
    end
  end
end
