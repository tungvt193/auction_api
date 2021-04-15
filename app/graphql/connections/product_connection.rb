# frozen_string_literal: true

class ProductsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::ProductType)

  graphql_name('ProductsEdgeType')
end

module Connections
  class ProductConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(ProductsEdgeType)
  end
end
