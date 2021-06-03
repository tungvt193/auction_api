# frozen_string_literal: true

class WardsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::WardType)

  graphql_name('WardsEdgeType')
end

module Connections
  class WardConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(WardsEdgeType)
  end
end
