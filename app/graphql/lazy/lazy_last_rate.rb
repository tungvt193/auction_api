module Lazy
  class LazyLastRate < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Rate.where(ratable_type: obj.class.name, ratable_id: ids).group_by(&:ratable_id).each do |_k, v|
          loader.call(v.last.try(:ratable_id)) { v.last }
        end
      end
    end
  end
end
