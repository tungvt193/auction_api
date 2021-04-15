# frozen_string_literal: true

class BannersEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::BannerType)

  graphql_name('BannersEdgeType')
end

module Connections
  class BannerConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(BannersEdgeType)
  end
end
