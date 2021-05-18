module Policies
  class AdminPolicy < BasePolicy
    class << self
      def query
        {
          v1AdminBookingList: {
            guard: ->(_obj, _args, ctx) { is_admin?(ctx) }
          },
          v1AdminBookingSummary: {
            guard: ->(_obj, _args, ctx) { is_admin?(ctx) }
          },
          v1AdminNotification: {
            guard: ->(_obj, _args, ctx) { is_admin?(ctx) }
          },
          v1AdminNotificationList: {
            guard: ->(_obj, _args, ctx) { is_admin?(ctx) }
          }
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

      def is_admin?(ctx)
        ctx[:current_user].try(:admin?)
      end
    end
  end
end
