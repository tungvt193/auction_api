module Mutations
  module Admin
    module Products
      class CreateProduct < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        argument :thumb, Types::FileType, required: false
        field :data, ::Types::ProductType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)
            resource.thumb = params[:thumb]

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :name, :keyword, :category_id, :slug, :sub_category_id,
            :short_description, :started_at, :status,
            :model, :product_type, :score
          )
        end
      end
    end
  end
end
