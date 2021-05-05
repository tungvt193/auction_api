module Policies
  class WebPolicy < BasePolicy
    class << self
      def query
        {}
      end

      def mutation
        {
          v1WebSignIn: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1WebForgotPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1WebResetPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          }
        }
      end
    end
  end
end
