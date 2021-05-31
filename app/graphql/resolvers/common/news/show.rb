module Resolvers
  module Common
    module News
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::NewsType, null: false

        def resolve(id:)
          news = ::News.where(id_or_slug: try_decode(id)).first
          raise ActiveRecord::RecordNotFound, 'Không tìm thấy tài bài viết này!' if news.blank?

          news
        end
      end
    end
  end
end
