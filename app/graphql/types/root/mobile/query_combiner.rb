module Types
  module Root
    # noinspection ALL
    module Mobile
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1MobileBookingSummary, ::Connections::BookingSummaryConnection,
                function: ::Resolvers::Mobile::Bookings::Summary, null: true, connection: true
          field :v1MobileBookingList, ::Connections::BookingConnection,
                function: ::Resolvers::Mobile::Bookings::List, null: true, connection: true
          field :v1MobileBooking, resolver: ::Resolvers::Mobile::Bookings::Show
          field :v1MobileRateList, ::Connections::RateConnection,
                function: ::Resolvers::Mobile::Rates::List, null: true, connection: true
          field :v1MobileRate, resolver: ::Resolvers::Mobile::Rates::Show
        end
      end
    end
  end
end
