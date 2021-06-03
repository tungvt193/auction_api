# frozen_string_literal: true

class DistrictsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::DistrictType)

  graphql_name('DistrictsEdgeType')
end

module Connections
  class DistrictConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(DistrictsEdgeType)
  end
end
