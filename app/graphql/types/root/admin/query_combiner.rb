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

          field :v1AdminCategoryList, ::Connections::CategoryConnection,
                function: ::Resolvers::Admin::Categories::List, null: true, connection: true
          field :v1AdminCategory, resolver: ::Resolvers::Admin::Categories::Show

          field :v1AdminSubCategoryList, ::Connections::SubCategoryConnection,
                function: ::Resolvers::Admin::SubCategories::List, null: true, connection: true
          field :v1AdminSubCategory, resolver: ::Resolvers::Admin::SubCategories::Show
          field :v1AdminProductList, ::Connections::ProductConnection,
                function: ::Resolvers::Admin::Products::List, null: true, connection: true
          field :v1AdminProduct, resolver: ::Resolvers::Admin::Products::Show

          field :v1AdminRateList, ::Connections::RateConnection,
                function: ::Resolvers::Admin::Rates::List, null: true, connection: true

          field :v1AdminNotificationBadge, resolver: ::Resolvers::Admin::Notifications::Badge
        end
      end
    end
  end
end
