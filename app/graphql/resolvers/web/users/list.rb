module Resolvers
  module Web
    module Users
      class List < ::Resolvers::BaseQuery
        scope { ::User.all }
        type types[::Types::UserType]

        option :per_page, type: types.Int, default: 10, with: :apply_per_page

        def normalize_filters(value, branches = [])
          query = super

          scope = ::User.graphql_ransack(query)
          branches << scope

          branches
        end

        def fetch_results
          # NOTE: Don't run QueryResolver during tests
          return super if context.blank?

          GraphQL::QueryResolver.run(::User, context, ::Types::UserType) do
            super
          end
        end
      end
    end
  end
end
