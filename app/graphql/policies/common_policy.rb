module Policies
  class CommonPolicy < BasePolicy
    class << self
      def query
        {}
      end

      def mutation
        {
          v1CommonSignIn: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1CommonForgotPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1CommonVerifyOtp: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1CommonResetPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          }
        }
      end
    end
  end
end
