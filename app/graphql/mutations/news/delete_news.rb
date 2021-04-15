module Mutations
  module News
    class DeleteNews < BaseMutation
      argument :id, ID, required: true
      field :data, ::Types::NewsType, null: false

      def resolve(args)
        super

        resource = object_from_id(args[:id])
        resource.destroy!

        { data: resource }
      end
    end
  end
end
