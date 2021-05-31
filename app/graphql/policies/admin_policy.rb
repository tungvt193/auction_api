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
        }.merge(block_policy('Auction')).
          merge(block_policy('Banner')).
          merge(block_policy('Booking')).
          merge(block_policy('Category')).
          merge(block_policy('Company')).
          merge(block_policy('Image')).
          merge(block_policy('News')).
          merge(block_policy('Video'))
      end

      private

      def block_policy(model_name)
        create_action = 'v1AdminCreate' + model_name
        update_action = 'v1AdminUpdate' + model_name
        delete_action = 'v1AdminDelete' + model_name

        block = {}

        block[create_action.to_sym] = admin_guard
        block[update_action.to_sym] = admin_guard
        block[delete_action.to_sym] = admin_guard

        block
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
