module Mutations
  module Admin
    module Orders
      class DeleteOrder < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::OrderType, null: false

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
