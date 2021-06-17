module Mutations
  module Admin
    module Images
      class UpdateImage < BaseMutation
        argument :id, ID, required: true
        argument :file, Types::FileType, required: true
        field :data, ::Types::ImageType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])

          ApplicationRecord.transaction do
            resource.file = params[:file]
            resource.save!
          end

          { data: resource }
        end
      end
    end
  end
end
