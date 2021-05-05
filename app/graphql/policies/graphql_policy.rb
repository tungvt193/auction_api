module Policies
  class GraphqlPolicy < BasePolicy
    RULES = {
      'Query' => query_policies,
      'Mutation' => mutation_policies
    }.freeze

    private

    def mutation_policies
      {
        '*': {
          guard: ->(_obj, _args, ctx) { roles.include?(ctx[:current_user].try(:role)) }
        }
      }.
        merge(Policies::AdminPolicy.mutation).
        merge(Policies::CommonPolicy.mutation).
        merge(Policies::MobilePolicy.mutation).
        merge(Policies::WebPolicy.mutation)
    end

    def query_policies
      {
        '*': {
          guard: ->(_obj, _args, _ctx) { true }
        }
      }.
        merge(Policies::AdminPolicy.query).
        merge(Policies::CommonPolicy.query).
        merge(Policies::MobilePolicy.query).
        merge(Policies::WebPolicy.query)
    end
  end
end
