# frozen_string_literal: true

class NotificationsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::NotificationType)

  graphql_name('NotificationsEdgeType')
end

module Connections
  class NotificationConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(NotificationsEdgeType)
  end
end
