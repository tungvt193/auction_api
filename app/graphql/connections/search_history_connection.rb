# frozen_string_literal: true

class SearchHistoriesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::SearchHistoryType)

  graphql_name('SearchHistoriesEdgeType')
end

module Connections
  class SearchHistoryConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(SearchHistoriesEdgeType)
  end
end
