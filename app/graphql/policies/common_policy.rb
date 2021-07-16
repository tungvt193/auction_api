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
          v1CommonOrder: user_guard,
          v1CommonSearchHistoryList: user_guard,
          v1CommonSearchHistory: user_guard,
          v1CommonNotificationList: anonymous_guard,
          v1CommonNotification: user_guard
        }
      end

      def mutation
        {
          v1CommonSignIn: anonymous_guard,
          v1CommonForgotPassword: anonymous_guard,
          v1CommonVerifyOtp: anonymous_guard,
          v1CommonResetPassword: anonymous_guard,
          v1CommonUpdateProfile: user_guard,
          v1CommonUsersFollow: user_guard,
          v1CommonCreateSearchHistory: user_guard,
          v1CommonDeleteSearchHistory: user_guard,
          v1CommonDeleteNotification: user_guard,
          v1CommonCreateDeviceToken: anonymous_guard
        }.merge(block_policy('Booking'))
      end

      private

      def user_guard
        { guard: ->(_obj, _args, ctx) { is_present?(ctx) } }
      end

      def anonymous_guard
        {
          guard: ->(_obj, _args, _ctx) { true }
        }
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
