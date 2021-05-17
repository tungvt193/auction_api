module Types
  module Root
    # noinspection ALL
    module Admin
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1AdminBookingSummary, ::Connections::BookingSummaryConnection,
                function: ::Resolvers::Admin::Bookings::Summary, null: true, connection: true
          field :v1AdminBookingList, ::Connections::BookingConnection,
                function: ::Resolvers::Admin::Bookings::List, null: true, connection: true
          field :v1AdminBooking, resolver: ::Resolvers::Admin::Bookings::Show
          field :v1AdminNotificationsList, ::Connections::NotificationConnection,
                function: ::Resolvers::Admin::Notifications::List, null: true, connection: true
          field :v1AdminNotifications, resolver: ::Resolvers::Admin::Notifications::Show
          field :v1AdminCustomers, ::Connections::UserConnection,
                function: ::Resolvers::Admin::Customers::List, null: true, connection: true
        end
      end
    end
  end
end
