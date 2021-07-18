module Lazy
  class LazySupporter < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:supporter_id)).batch(default_value: nil, cache: true) do |ids, loader|
        ::User.where(id: ids).each do |supporter|
          loader.call(supporter.try(:id)) { supporter }
        end
      end
    end
  end
end
