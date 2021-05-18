# frozen_string_literal: true

class BookingsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::BookingType)

  graphql_name('BookingsEdgeType')
end

module Connections
  class BookingConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(BookingsEdgeType)
  end
end
