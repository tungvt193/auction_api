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
          'v1AdminCustomers': admin_guard,
          'v1AdminNewsList': admin_guard,
          'v1AdminNews': admin_guard,
          'v1AdminVideoList': admin_guard,
          'v1AdminVideo': admin_guard,
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
        }.merge(block_policy('Auction')).
          merge(block_policy('Banner')).
          merge(block_policy('Booking')).
          merge(block_policy('Category')).
          merge(block_policy('Company')).
          merge(block_policy('Image')).
          merge(block_policy('News')).
          merge(block_policy('Video')).
          merge(update_policy('User'))
      end

      private

      def block_policy(model_name)
        {
          "v1AdminCreate#{model_name}": admin_guard,
          "v1AdminUpdate#{model_name}": admin_guard,
          "v1AdminDelete#{model_name}": admin_guard
        }
      end

      def update_policy(model_name)
        {
          "v1AdminCreate#{model_name}": admin_guard,
          "v1AdminUpdate#{model_name}": admin_guard
        }
      end

      def admin_guard
        { guard: ->(_obj, _args, ctx) { is_admin?(ctx) } }
      end

      def is_admin?(ctx)
        ctx[:current_user].try(:admin?)
      end
    end
  end
end
