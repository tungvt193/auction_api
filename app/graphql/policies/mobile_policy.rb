module Policies
  class MobilePolicy < BasePolicy
    class << self
      def query
        {}
      end

      def mutation
        {
          v1MobileSignIn: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1MobileForgotPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1MobileVerifyOtp: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1MobileResetPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          }
        }
      end
    end
  end
end
