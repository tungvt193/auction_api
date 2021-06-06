module Lazy
  class LazyProvince < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:province_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Province.where(id: ids).each do |province|
          loader.call(province.try(:id)) { province }
        end
      end
    end
  end
end
