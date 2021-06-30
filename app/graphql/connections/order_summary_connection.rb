# frozen_string_literal: true

class OrderSummarysEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::OrderSummaryType)

  graphql_name('OrderSummarysEdgeType')
end

module Connections
  class OrderSummaryConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(OrderSummarysEdgeType)
  end
end
