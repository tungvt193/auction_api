module Mutations
  module Mobile
    module Images
      class DeleteImage < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::ImageType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])
          resource.destroy!

          { data: resource }
        end
      end
    end
  end
end
