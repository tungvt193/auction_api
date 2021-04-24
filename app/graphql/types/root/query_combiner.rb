module Types
  module Root
    # noinspection ALL
    module QueryCombiner
      extend ActiveSupport::Concern

      # CRUD
      included do
        field :v1UserList, ::Connections::UserConnection,
              function: ::Resolvers::Users::List, null: true, connection: true
        field :v1User, resolver: ::Resolvers::Users::Show

        field :v1BannerList, ::Connections::BannerConnection,
              function: ::Resolvers::Banners::List, null: true, connection: true
        field :v1Banner, resolver: ::Resolvers::Banners::Show

        field :v1CategoryList, ::Connections::CategoryConnection,
              function: ::Resolvers::Categories::List, null: true, connection: true
        field :v1Category, resolver: ::Resolvers::Categories::Show

        field :v1CompanyList, ::Connections::CompanyConnection,
              function: ::Resolvers::Companies::List, null: true, connection: true
        field :v1Company, resolver: ::Resolvers::Companies::Show

        field :v1ImageList, ::Connections::ImageConnection,
              function: ::Resolvers::Images::List, null: true, connection: true
        field :v1Image, resolver: ::Resolvers::Images::Show

        field :v1NewsList, ::Connections::NewsConnection,
              function: ::Resolvers::News::List, null: true, connection: true
        field :v1News, resolver: ::Resolvers::News::Show

        field :v1ProductList, ::Connections::ProductConnection,
              function: ::Resolvers::Products::List, null: true, connection: true
        field :v1Product, resolver: ::Resolvers::Products::Show

        field :v1VideoList, ::Connections::VideoConnection,
              function: ::Resolvers::Videos::List, null: true, connection: true
        field :v1Video, resolver: ::Resolvers::Videos::Show

        field :v1NearestAuctionList, ::Connections::AuctionConnection,
              function: ::Resolvers::Auctions::NearestList, null: true, connection: true

        field :v1AuctionItemList, ::Connections::AuctionItemConnection,
              function: ::Resolvers::AuctionItems::List, null: true, connection: true
        field :v1AuctionItemNearestList, ::Connections::AuctionItemConnection,
              function: ::Resolvers::AuctionItems::NearestList, null: true, connection: true
        field :v1AuctionItem, resolver: ::Resolvers::AuctionItems::Show
      end
    end
  end
end
