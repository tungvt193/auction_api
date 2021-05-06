module Mutations
  module Admin
    module Videos
      class DeleteVideo < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::VideoType, null: false

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
