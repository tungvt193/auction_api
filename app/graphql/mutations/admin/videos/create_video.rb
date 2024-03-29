module Mutations
  module Admin
    module Videos
      class CreateVideo < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::VideoType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :cover, :url, :title, :status, :slug, :published_at, :video_id
          )
        end
      end
    end
  end
end
