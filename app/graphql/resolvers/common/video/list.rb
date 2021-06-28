module Resolvers
  module Common
    module Video
      class List < ::Resolvers::BaseQuery
        scope { instance_scope }
        type types[::Types::VideoType]

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

          GraphQL::QueryResolver.run(::Video, context, ::Types::VideoType) do
            super
          end
        end

        private

        def instance_scope
          ::Video.active
        end
      end
    end
  end
end
