module Mutations
  module Common
    module SearchHistories
      class DeleteSearchHistory < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::SearchHistoryType, null: false

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
