module Mutations
  module Admin
    module News
      class CreateNews < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::NewsType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes.except(:content))
            resource.save_html(attributes[:content]) if attributes[:content].present?

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :content, :cover, :content, :short_description, :title,
            :status, :slug, :published_at
          )
        end
      end
    end
  end
end
