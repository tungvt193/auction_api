module Policies
  class GraphqlPolicy < BasePolicy
    RULES = {
      'Query' => {
        '*': {
          guard: ->(_obj, _args, _ctx) { true }
        }
      }.
            merge(Policies::AdminPolicy.query).
            merge(Policies::CommonPolicy.query).
            merge(Policies::MobilePolicy.query).
            merge(Policies::WebPolicy.query),
      'Mutation' => {
        '*': {
          guard: ->(_obj, _args, ctx) { roles.include?(ctx[:current_user].try(:role)) }
        }
      }.
            merge(Policies::AdminPolicy.mutation).
            merge(Policies::CommonPolicy.mutation).
            merge(Policies::MobilePolicy.mutation).
            merge(Policies::WebPolicy.mutation)
    }.freeze

    class << self
      def guard(type, field)
        RULES.dig(type.name, field, :guard)
      end

      def not_authorized_handler(type, field)
        RULES.dig(type, field, :not_authorized) || RULES.dig(type, :'*', :not_authorized)
      end
    end
  end
end
