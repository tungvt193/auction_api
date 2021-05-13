module Types
  module Root
    # noinspection ALL
    module Admin
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1AdminNotificationList, ::Connections::NotificationConnection,
                function: ::Resolvers::Admin::Notification::List, null: true, connection: true
          field :v1AdminNotification, resolver: ::Resolvers::Admin::Notification::Show
        end
      end
    end
  end
end
