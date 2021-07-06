module Mutations
  module Admin
    module Banners
      class UpdateBanner < BaseMutation
        argument :id, ID, required: true
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::BannerType, null: false
        argument :cover, Types::FileType, required: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)

            resource.assign_attributes(attributes)
            resource.cover = params[:cover] if params[:cover].present?
            
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.permit(:url, :cover, :title, :status)
        end
      end
    end
  end
end
