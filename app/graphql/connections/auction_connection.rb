# frozen_string_literal: true

class AuctionsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::AuctionType)

  graphql_name('AuctionsEdgeType')
end

module Connections
  class AuctionConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(AuctionsEdgeType)
  end
end
