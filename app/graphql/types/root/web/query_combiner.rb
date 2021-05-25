module Types
  module Root
    # noinspection ALL
    module Web
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1WebAuctionList, ::Connections::AuctionConnection,
                function: ::Resolvers::Web::Auctions::List, null: true, connection: true
          field :v1WebAuction, resolver: ::Resolvers::Web::Auctions::Show
          field :v1WebNearestAuctionList, ::Connections::AuctionConnection,
                function: ::Resolvers::Web::Auctions::NearestList, null: true, connection: true

          field :v1WebAuctionItemList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Web::AuctionItems::List, null: true, connection: true
          field :v1WebAuctionItemNearestList, ::Connections::AuctionItemConnection,
                function: ::Resolvers::Web::AuctionItems::NearestList, null: true, connection: true
          field :v1WebAuctionItem, resolver: ::Resolvers::Mobile::AuctionItems::Show

          field :v1WebCompanyList, ::Connections::CompanyConnection,
                function: ::Resolvers::Web::Companies::List, null: true, connection: true
          field :v1WebCompany, resolver: ::Resolvers::Web::Companies::Show
        end
      end
    end
  end
end
