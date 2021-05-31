module Resolvers
  module Common
    module Videos
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::VideoType, null: false

        def resolve(id:)
          video = ::Video.where(id_or_slug: try_decode(id)).first
          raise ActiveRecord::RecordNotFound, 'Không tìm thấy tài video này!' if video.blank?

          video
        end
      end
    end
  end
end
