module Mutations
  module Banners
    class UpdateBanner < BaseMutation
      argument :id, ID, required: true
      argument :attribute, Types::AttributeType, required: true
      field :data, ::Types::BannerType, null: false

      def resolve(args)
        super

        resource = object_from_id(args[:id])

        ApplicationRecord.transaction do
          encode_attributes = normalize_parameters(args[:attribute])
          attributes = decode_attributes(encode_attributes)
          attributes.merge!({ cover: args[:file] }) if args[:file].present?

          resource.assign_attributes(attributes)
          resource.save!
        end

        { data: resource }
      end

      private

      def normalize_parameters(args)
        ::ActionController::Parameters.new(args.as_json).permit(
          :id, :url, :cover, :title, :status
        )
      end
    end
  end
end
