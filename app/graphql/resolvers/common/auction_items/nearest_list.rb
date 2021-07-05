module Resolvers
  module Common
    module AuctionItems
      class NearestList < ::Resolvers::BaseQuery
        scope { instance_scope.order('auctions.started_at' => 'asc', 'auctions.ended_at' => 'asc') }
        type types[::Types::AuctionItemType]

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

          GraphQL::QueryResolver.run(::AuctionItem, context, ::Types::AuctionItemType) do
            super
          end
        end

        private

        def instance_scope
          ::AuctionItem.joins(:auction).where('auctions.status = ? AND (auctions.started_at >= ? OR auctions.ended_at >= ? ) AND auction_items.status = ?  OR auction_items.status = ? ', 1, Time.zone.now, Time.zone.now, 0, 1)
        end
      end
    end
  end
end
