# frozen_string_literal: true

class UsersEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::UserType)

  graphql_name('UsersEdgeType')
end

module Connections
  class UserConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(UsersEdgeType)
  end
end
