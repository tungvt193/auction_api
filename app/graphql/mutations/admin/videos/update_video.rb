module Mutations
  module Admin
    module Videos
      class UpdateVideo < BaseMutation
        argument :id, ID, required: true
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::VideoType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])

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
            :id, :cover, :url, :title, :status, :slug, :published_at, :video_id
          )
        end
      end
    end
  end
end
