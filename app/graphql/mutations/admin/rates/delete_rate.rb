module Mutations
  module Admin
    module Rates
      class DeleteRate < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::RateType, null: false

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
