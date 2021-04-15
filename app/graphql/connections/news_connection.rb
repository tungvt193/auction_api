# frozen_string_literal: true

class NewsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::NewsType)

  graphql_name('NewsEdgeType')
end

module Connections
  class NewsConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(NewsEdgeType)
  end
end
