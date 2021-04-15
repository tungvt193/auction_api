# frozen_string_literal: true

class RatesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::RateType)

  graphql_name('RatesEdgeType')
end

module Connections
  class RateConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(RatesEdgeType)
  end
end
