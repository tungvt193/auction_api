module Resolvers
  module Auctions
    class NearestList < ::Resolvers::BaseQuery
      scope { instance_scope.order('started_at asc') }
      type types[::Types::AuctionType]

      option :per_page, type: types.Int, default: 10, with: :apply_per_page

      def normalize_filters(value, branches = [])
        query = super

        scope = instance_scope.graphql_ransack(query).order('started_at asc')
        branches << scope

        branches
      end

      def fetch_results
        # NOTE: Don't run QueryResolver during tests
        return super if context.blank?

        GraphQL::QueryResolver.run(::Auction, context, ::Types::AuctionType) do
          super
        end
      end

      private

      def instance_scope
        ::Auction.graphql_ransack({
          status_eq: 'active',
          started_at_gteq: Time.zone.now
        })
      end
    end
  end
end
