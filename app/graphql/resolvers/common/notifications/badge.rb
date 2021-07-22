module Resolvers
  module Common
    module Notifications
      class Badge < ::Resolvers::BaseResolver
        type ::Types::BadgeType, null: false

        def resolve
          ::OpenStruct.new({
                             message: 'Fetch data successful',
                             badge: unread_notifications.size
                           })
        end

        private

        def unread_notifications
          return [] if current_user.blank?

          ::Notification.available_notification(current_user).where(
            '(reader_ids NOT LIKE ?) IS NOT TRUE ',
            "%#{current_user.try(:id)} ,"
          )
        end
      end
    end
  end
end
