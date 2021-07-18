module Lazy
  class LazyWard < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:ward_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::Ward.where(id: ids).each do |ward|
          loader.call(ward.try(:id)) { ward }
        end
      end
    end
  end
end
