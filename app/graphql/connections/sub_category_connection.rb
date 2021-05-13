# frozen_string_literal: true

class SubCategoriesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::SubCategoryType)

  graphql_name('SubCategoriesEdgeType')
end

module Connections
  class SubCategoryConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(SubCategoriesEdgeType)
  end
end
