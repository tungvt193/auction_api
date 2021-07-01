module Policies
  class CommonPolicy < BasePolicy
    class << self
      def query
        {
          v1CommonMyProfile: user_guard,
          v1CommonBookingSummary: user_guard,
          v1CommonBookingList: user_guard,
          v1CommonBooking: user_guard,
          v1CommonOrderSummary: user_guard,
          v1CommonOrderList: user_guard,
          v1CommonOrder: user_guard
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
          },
          v1CommonUpdateProfile: user_guard,
          v1CommonUsersFollow: user_guard
        }.merge(block_policy('Booking'))
      end

      private

      def user_guard
        { guard: ->(_obj, _args, ctx) { is_present?(ctx) } }
      end

      def is_present?(ctx)
        ctx[:current_user].present?
      end

      def block_policy(model_name)
        {
          "v1CommonCreate#{model_name}": user_guard,
          "v1CommonUpdate#{model_name}": user_guard,
          "v1CommonDelete#{model_name}": user_guard
        }
      end
    end
  end
end
