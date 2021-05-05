module Types
  module Root
    # noinspection ALL
    module Mobile
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1MobileUserList, ::Connections::UserConnection,
                function: ::Resolvers::Mobile::Users::List, null: true, connection: true
          field :v1MobileUser, resolver: ::Resolvers::Mobile::Users::Show

          field :v1MobileBannerList, ::Connections::BannerConnection,
                function: ::Resolvers::Mobile::Banners::List, null: true, connection: true
          field :v1MobileBanner, resolver: ::Resolvers::Mobile::Banners::Show

          field :v1MobileCategoryList, ::Connections::CategoryConnection,
                function: ::Resolvers::Mobile::Categories::List, null: true, connection: true
          field :v1MobileCategory, resolver: ::Resolvers::Mobile::Categories::Show

          field :v1MobileCompanyList, ::Connections::CompanyConnection,
                function: ::Resolvers::Mobile::Companies::List, null: true, connection: true
          field :v1MobileCompany, resolver: ::Resolvers::Mobile::Companies::Show

          field :v1MobileImageList, ::Connections::ImageConnection,
                function: ::Resolvers::Mobile::Images::List, null: true, connection: true
          field :v1MobileImage, resolver: ::Resolvers::Mobile::Images::Show

          field :v1MobileNewsList, ::Connections::NewsConnection,
                function: ::Resolvers::Mobile::News::List, null: true, connection: true
          field :v1MobileNews, resolver: ::Resolvers::Mobile::News::Show

          field :v1MobileProductList, ::Connections::ProductConnection,
                function: ::Resolvers::Mobile::Products::List, null: true, connection: true
          field :v1MobileProduct, resolver: ::Resolvers::Mobile::Products::Show

          field :v1MobileVideoList, ::Connections::VideoConnection,
                function: ::Resolvers::Mobile::Videos::List, null: true, connection: true
          field :v1MobileVideo, resolver: ::Resolvers::Mobile::Videos::Show

          field :v1MobileNearestAuctionList, ::Connections::AuctionConnection,
                function: ::Resolvers::Mobile::Auctions::NearestList, null: true, connection: true

          field :v1MobileAuctionItemList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Mobile::AuctionItems::List, null: true, connection: true
          field :v1MobileAuctionItemNearestList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Mobile::AuctionItems::NearestList, null: true, connection: true
          field :v1MobileAuctionItem, resolver: ::Resolvers::Mobile::AuctionItems::Show
        end
      end
    end
  end
end
