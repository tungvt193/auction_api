module Lazy
  class LazyCompaniesOfProduct < Base
    def call(obj, _args, _ctx)
      BatchLoader::GraphQL.for(obj.try(:id)).batch(default_value: [], cache: false) do |ids, loader|
        ::ProductCompany.includes(:company).where(product_id: ids).each do |product_company|
          loader.call(product_company.try(:product_id)) { |memo| memo << product_company.company }
        end
      end
    end
  end
end
