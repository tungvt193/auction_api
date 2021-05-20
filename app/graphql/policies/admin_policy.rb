module Policies
  class AdminPolicy < BasePolicy
    class << self
      def query
        {
          'v1AdminBookingSummary': admin_guard,
          'v1AdminBookingList': admin_guard,
          'v1AdminBooking': admin_guard,
          'v1AdminNotificationsList': admin_guard,
          'v1AdminNotifications': admin_guard,
          'v1AdminCustomers': admin_guard
        }
      end

      def mutation
        {
          v1AdminSignIn: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1AdminForgotPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          },
          v1AdminResetPassword: {
            guard: ->(_obj, _args, _ctx) { true }
          }
        }
      end

      private


      def admin_guard
        { guard: ->(_obj, _args, ctx) { is_admin?(ctx) } }
      end

      def is_admin?(ctx)
        ctx[:current_user].try(:admin?)
      end
    end
  end
end
