# frozen_string_literal: true

class ProvincesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::ProvinceType)

  graphql_name('ProvincesEdgeType')
end

module Connections
  class ProvinceConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(ProvincesEdgeType)
  end
end
