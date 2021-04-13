# frozen_string_literal: true

module Types
  class QueryType < GraphQL::Schema::Object
    include Types::Root::QueryCombiner
  end
end
