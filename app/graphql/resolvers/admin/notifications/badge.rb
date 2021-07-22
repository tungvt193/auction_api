module Resolvers
  module Admin
    module Notifications
      class Badge < ::Resolvers::BaseResolver
        type Int, null: false

        def resolve
          return 0 if current_user.blank?

          unread_notifications = ::Notification.available_notification(current_user).where(
            '(reader_ids NOT LIKE ?) IS NOT TRUE ',
            "%#{current_user.try(:id)} ,"
          )

          unread_notifications.size
        end
      end
    end
  end
end
