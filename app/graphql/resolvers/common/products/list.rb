module Resolvers
  module Common
    module Products
      class List < ::Resolvers::BaseQuery
        scope { instance_scope }
        type types[::Types::ProductType]

        option :per_page, type: types.Int, default: 10, with: :apply_per_page

        def normalize_filters(value, branches = [])
          query = super

          scope = query['smart_filter'].present? ? ::Product.search(query['smart_filter']).records : ::Product
          scope = scope.graphql_ransack(query)
          branches << scope

          branches
        end

        def fetch_results
          # NOTE: Don't run QueryResolver during tests
          return super if context.blank?

          GraphQL::QueryResolver.run(::Product, context, ::Types::ProductType) do
            super
          end
        end

        private

        def instance_scope
          ::Product.all
        end
      end
    end
  end
end
