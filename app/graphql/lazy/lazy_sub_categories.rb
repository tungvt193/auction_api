module Lazy
  class LazySubCategories < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: [], cache: true) do |ids, loader|
        ::SubCategory.where(category_id: ids).each do |record|
          loader.call(record.try(:category_id)) { |memo| memo << record }
        end
      end
    end
  end
end
