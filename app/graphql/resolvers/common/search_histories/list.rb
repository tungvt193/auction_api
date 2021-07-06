module Resolvers
  module Common
    module SearchHistories
      class List < ::Resolvers::BaseQuery
        scope { instance_scope }
        type types[::Types::SearchHistoryType]

        option :per_page, type: types.Int, default: 10, with: :apply_per_page

        def normalize_filters(value, branches = [])
          query = super

          scope = scope.graphql_ransack(query)
          branches << scope

          branches
        end

        def fetch_results
          # NOTE: Don't run QueryResolver during tests
          return super if context.blank?

          GraphQL::QueryResolver.run(::SearchHistory, context, ::Types::SearchHistoryType) do
            super
          end
        end

        private

        def instance_scope
          ::SearchHistory.where(user_id: current_user.try(:id))
        end
      end
    end
  end
end
