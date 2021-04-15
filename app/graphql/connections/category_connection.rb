# frozen_string_literal: true

class CategoriesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::CategoryType)

  graphql_name('CategoriesEdgeType')
end

module Connections
  class CategoryConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(CategoriesEdgeType)
  end
end
