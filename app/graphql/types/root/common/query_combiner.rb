module Types
  module Root
    # noinspection ALL
    module Common
      module QueryCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1CommonBannerList, ::Connections::BannerConnection,
                function: ::Resolvers::Common::Banners::List, null: true, connection: true
          field :v1CommonBanner, resolver: ::Resolvers::Common::Banners::Show

          field :v1CommonCategoryList, ::Connections::CategoryConnection,
                function: ::Resolvers::Common::Categories::List, null: true, connection: true
          field :v1CommonCategory, resolver: ::Resolvers::Common::Categories::Show

          field :v1CommonNewsList, ::Connections::NewsConnection,
                function: ::Resolvers::Common::News::List, null: true, connection: true
          field :v1CommonNews, resolver: ::Resolvers::Common::News::Show

          field :v1CommonVideoList, ::Connections::VideoConnection,
                function: ::Resolvers::Common::Videos::List, null: true, connection: true
          field :v1CommonVideo, resolver: ::Resolvers::Common::Videos::Show

          field :v1CommonUserByUsername, resolver: ::Resolvers::Common::Users::ByUsername

          field :v1CommonSubCategoryList, ::Connections::SubCategoryConnection,
                function: ::Resolvers::Common::SubCategories::List, null: true, connection: true
          field :v1CommonSubCategory, resolver: ::Resolvers::Common::SubCategories::Show
        end
      end
    end
  end
end
