module Mutations
  module Images
    class CreateImage < BaseMutation
      argument :attribute, Types::AttributeType, required: true
      field :data, ::Types::ImageType, null: false

      def resolve(args)
        super

        resource = collection.new

        ApplicationRecord.transaction do
          encode_attributes = normalize_parameters(args[:attribute])
          attributes = decode_attributes(encode_attributes)

          resource.assign_attributes(attributes)
          resource.save!
        end

        { data: resource }
      end

      private

      def normalize_parameters(args)
        ::ActionController::Parameters.new(args.as_json).permit(
          :file
        )
      end
    end
  end
end
