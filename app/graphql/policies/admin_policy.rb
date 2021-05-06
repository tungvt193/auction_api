module Policies
  class AdminPolicy < BasePolicy
    class << self
      def query
        {}
      end

      def mutation
        {
          v1AdminSignIn: {
            guard: ->(_obj, _args, ctx) { is_admin?(ctx) }
          },
          v1AdminForgotPassword: {
            guard: ->(_obj, _args, ctx) { is_admin?(ctx) }
          },
          v1AdminResetPassword: {
            guard: ->(_obj, _args, ctx) { is_admin?(ctx) }
          }
        }
      end

      private

      def is_admin?(ctx)
        ctx[:current_user].try(:admin?)
      end
    end
  end
end
