module Resolvers
  module Admin
    module Video
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::VideoType, null: false

        def resolve(id:)
          video = ::Video.graphql_ransack(id_or_slug_eq: try_decode(id)).first
          raise ActiveRecord::RecordNotFound, 'Không tìm thấy tài video này!' if video.blank?

          video
        end
      end
    end
  end
end
