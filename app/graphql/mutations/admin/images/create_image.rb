module Mutations
  module Admin
    module Images
      class CreateImage < BaseMutation
        argument :file, Types::FileType, required: true
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::ImageType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            resource.assign_attributes(normalize_parameters)
            resource.file = params[:file]
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_params
          params.require(:attribute).permit(:imageable_type, :imageable_id)
        end
      end
    end
  end
end
