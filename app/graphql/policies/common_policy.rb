module Policies
  class CommonPolicy < BasePolicy
    class << self
      def query
        {
          'v1CommonMyProfile': user_guard,
        }
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

      private

      def user_guard
        { guard: ->(_obj, _args, ctx) { is_present?(ctx) } }
      end

      def is_present?(ctx)
        ctx[:current_user].present?
      end
    end
  end
end
