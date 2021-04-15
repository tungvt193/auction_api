# frozen_string_literal: true

class ImagesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::ImageType)

  graphql_name('ImagesEdgeType')
end

module Connections
  class ImageConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(ImagesEdgeType)
  end
end
