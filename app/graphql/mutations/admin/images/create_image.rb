module Mutations
  module Admin
    module Images
      class CreateImage < BaseMutation
        argument :file, Types::FileType, required: true
        field :data, ::Types::ImageType, null: false

        def resolve(args)
          super

          resource = collection.new

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
