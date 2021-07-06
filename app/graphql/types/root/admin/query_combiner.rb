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
          field :v1AdminNewsList, ::Connections::NewsConnection,
                function: ::Resolvers::Admin::News::List, null: true, connection: true
          field :v1AdminNews, resolver: ::Resolvers::Admin::News::Show
          field :v1AdminVideoList, ::Connections::VideoConnection,
                function: ::Resolvers::Admin::Video::List, null: true, connection: true
          field :v1AdminVideo, resolver: ::Resolvers::Admin::Video::Show
          field :v1AdminOrderSummary, ::Connections::OrderSummaryConnection,
                function: ::Resolvers::Admin::Orders::Summary, null: true, connection: true
          field :v1AdminOrderList, ::Connections::OrderConnection,
                function: ::Resolvers::Admin::Orders::List, null: true, connection: true
          field :v1AdminOrder, resolver: ::Resolvers::Admin::Orders::Show
          field :v1AdminAuctionList, ::Connections::AuctionConnection,
                function: ::Resolvers::Admin::Auctions::List, null: true, connection: true
          field :v1AdminAuction, resolver: ::Resolvers::Admin::Auctions::Show
          field :v1AdminAuctionItemList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Admin::AuctionItems::List, null: true, connection: true
          field :v1AdminAuctionItem, resolver: ::Resolvers::Admin::AuctionItems::Show
          field :v1AdminBannerList, ::Connections::BannerConnection,
                function: ::Resolvers::Admin::Banners::List, null: true, connection: true
          field :v1AdminBanner, resolver: ::Resolvers::Admin::Banners::Show

          field :v1CommonCategoryList, ::Connections::CategoryConnection,
                function: ::Resolvers::Common::Categories::List, null: true, connection: true
          field :v1CommonCategory, resolver: ::Resolvers::Common::Categories::Show

          field :v1CommonSubCategoryList, ::Connections::SubCategoryConnection,
                function: ::Resolvers::Common::SubCategories::List, null: true, connection: true
          field :v1CommonSubCategory, resolver: ::Resolvers::Common::SubCategories::Show
        end
      end
    end
  end
end
