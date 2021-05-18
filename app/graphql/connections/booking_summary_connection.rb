# frozen_string_literal: true

class BookingSummarysEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::BookingSummaryType)

  graphql_name('BookingSummarysEdgeType')
end

module Connections
  class BookingSummaryConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(BookingSummarysEdgeType)
  end
end
