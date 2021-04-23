# frozen_string_literal: true

class AuctionItemsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::AuctionItemType)

  graphql_name('AuctionItemsEdgeType')
end

module Connections
  class AuctionItemConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(AuctionItemsEdgeType)
  end
end
