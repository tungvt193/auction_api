module Lazy
  class LazyCompany < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:company_id)).batch(default_value: nil, cache: false) do |ids, loader|
        ::Company.where(id: ids).each do |company, _v|
          loader.call(company.try(:id)) { company }
        end
      end
    end
  end
end
