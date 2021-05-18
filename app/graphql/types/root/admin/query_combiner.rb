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

          field :v1AdminBookingSummary, ::Connections::BookingSummaryConnection,
                function: ::Resolvers::Admin::Bookings::Summary, null: true, connection: true
          field :v1AdminBookingList, ::Connections::BookingConnection,
                function: ::Resolvers::Admin::Bookings::List, null: true, connection: true
          field :v1AdminBooking, resolver: ::Resolvers::Admin::Bookings::Show
        end
      end
    end
  end
end
