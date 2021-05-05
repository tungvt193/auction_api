module Mutations
  module Mobile
    module Categories
      class DeleteCategory < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::CategoryType, null: false

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
