module Resolvers
  module Common
    module News
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::NewsType, null: false

        def resolve(id:)
          news = ::News.graphql_ransack(id_or_slug_eq: try_decode(id)).first
          raise ActiveRecord::RecordNotFound, 'Không tìm thấy tài bài viết này!' if news.blank?

          news
        end
      end
    end
  end
end
