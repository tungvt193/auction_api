# frozen_string_literal: true

class OrdersEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::OrderType)

  graphql_name('OrdersEdgeType')
end

module Connections
  class OrderConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(OrdersEdgeType)
  end
end
