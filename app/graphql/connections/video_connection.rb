# frozen_string_literal: true

class VideosEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::VideoType)

  graphql_name('VideosEdgeType')
end

module Connections
  class VideoConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(VideosEdgeType)
  end
end
