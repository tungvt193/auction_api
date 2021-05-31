module Mutations
  module Web
    module Followers
      class DeleteFollower < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::FollowerType, null: false

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
