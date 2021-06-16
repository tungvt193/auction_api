module Mutations
  module Admin
    module Banners
      class CreateBanner < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::BannerType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            attributes.merge!({ cover: args[:file] }) if args[:file].present?

            resource.assign_attributes(attributes)
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :url, :title, :status
          )
        end
      end
    end
  end
end
