module Policies
  class AdminPolicy < BasePolicy
    class << self
      def query
        {}
      end

      def mutation
        {
          v1AdminSignIn: {
            guard: ->(_obj, _args, ctx) { true }
          },
          v1AdminForgotPassword: {
            guard: ->(_obj, _args, ctx) { true }
          },
          v1AdminResetPassword: {
            guard: ->(_obj, _args, ctx) { true }
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
