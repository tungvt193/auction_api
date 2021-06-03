module Types
  module Root
    # noinspection ALL
    module Common
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1CommonNearestAuctionList, ::Connections::AuctionConnection,
                function: ::Resolvers::Common::Auctions::NearestList, null: true, connection: true
          field :v1CommonAuctionList, ::Connections::AuctionConnection,
                function: ::Resolvers::Common::Auctions::List, null: true, connection: true
          field :v1CommonAuction, resolver: ::Resolvers::Common::Auctions::Show

          field :v1CommonAuctionItemList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Common::AuctionItems::List, null: true, connection: true
          field :v1CommonAuctionItemNearestList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Common::AuctionItems::NearestList, null: true, connection: true
          field :v1CommonFollowedAuctionItemList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Common::AuctionItems::FollowedByCurrentUserList, null: true, connection: true
          field :v1CommonAuctionItem, resolver: ::Resolvers::Common::AuctionItems::Show

          field :v1CommonBannerList, ::Connections::BannerConnection,
                function: ::Resolvers::Common::Banners::List, null: true, connection: true
          field :v1CommonBanner, resolver: ::Resolvers::Common::Banners::Show

          field :v1CommonCategoryList, ::Connections::CategoryConnection,
                function: ::Resolvers::Common::Categories::List, null: true, connection: true
          field :v1CommonCategory, resolver: ::Resolvers::Common::Categories::Show

          field :v1CommonNewsList, ::Connections::NewsConnection,
                function: ::Resolvers::Common::News::List, null: true, connection: true
          field :v1CommonNews, resolver: ::Resolvers::Common::News::Show

          field :v1CommonProductList, ::Connections::ProductConnection,
                function: ::Resolvers::Common::Products::List, null: true, connection: true
          field :v1CommonProduct, resolver: ::Resolvers::Common::Products::Show

          field :v1CommonVideoList, ::Connections::VideoConnection,
                function: ::Resolvers::Common::Videos::List, null: true, connection: true
          field :v1CommonVideo, resolver: ::Resolvers::Common::Videos::Show

          field :v1CommonUserList, ::Connections::UserConnection,
                function: ::Resolvers::Common::Users::List, null: true, connection: true
          field :v1CommonUser, resolver: ::Resolvers::Common::Users::Show
          field :v1CommonUserByUsername, resolver: ::Resolvers::Common::Users::ByUsername

          field :v1CommonSubCategoryList, ::Connections::SubCategoryConnection,
                function: ::Resolvers::Common::SubCategories::List, null: true, connection: true
          field :v1CommonSubCategory, resolver: ::Resolvers::Common::SubCategories::Show

          field :v1CommonCompanyList, ::Connections::CompanyConnection,
                function: ::Resolvers::Common::Companies::List, null: true, connection: true
          field :v1CommonCompany, resolver: ::Resolvers::Common::Companies::Show

          field :v1CommonImageList, ::Connections::ImageConnection,
                function: ::Resolvers::Common::Images::List, null: true, connection: true
          field :v1CommonImage, resolver: ::Resolvers::Common::Images::Show

          field :v1CommonMyProfile, resolver: ::Resolvers::Common::Users::MyProfile

          field :v1CommonProvinceList, ::Connections::ProvinceConnection,
                function: ::Resolvers::Common::Provinces::List, null: true, connection: true
          field :v1CommonDistrictList, ::Connections::DistrictConnection,
                function: ::Resolvers::Common::Districts::List, null: true, connection: true
          field :v1CommonWardList, ::Connections::WardConnection,
                function: ::Resolvers::Common::Wards::List, null: true, connection: true
        end
      end
    end
  end
end
