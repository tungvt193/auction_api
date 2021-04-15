module Resolvers
  module News
    class List < ::Resolvers::BaseQuery
      scope { instance_scope }
      type types[::Types::NewsType]

      option :per_page, type: types.Int, default: 10, with: :apply_per_page

      def normalize_filters(value, branches = [])
        query = super

        scope = instance_scope.graphql_ransack(query)
        branches << scope

        branches
      end

      def fetch_results
        # NOTE: Don't run QueryResolver during tests
        return super if context.blank?

        GraphQL::QueryResolver.run(::News, context, ::Types::NewsType) do
          super
        end
      end

      private

      def instance_scope
        ::News.active
      end
    end
  end
end
