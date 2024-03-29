module Mutations
  module Admin
    module Images
      class CreateImage < BaseMutation
        argument :file, Types::FileType, required: true
        argument :attribute, Types::AttributeType, required: false
        field :data, ::Types::ImageType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            resource.assign_attributes(normalize_parameters)
            resource.file = params[:file]
            resource.name = File.try(:basename, params[:file])
            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:imageable_type, :imageable_id)
        end
      end
    end
  end
end
