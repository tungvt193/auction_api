module Lazy
  class LazyDistrict < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:district_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::District.where(id: ids).each do |district|
          loader.call(district.try(:id)) { district }
        end
      end
    end
  end
end
