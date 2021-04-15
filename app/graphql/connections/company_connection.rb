# frozen_string_literal: true

class CompaniesEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::CompanyType)

  graphql_name('CompaniesEdgeType')
end

module Connections
  class CompanyConnection < GraphQL::Types::Relay::BaseConnection
    field :meta, Types::MetaType, null: false

    def meta
      object.nodes
    end

    edge_type(CompaniesEdgeType)
  end
end
