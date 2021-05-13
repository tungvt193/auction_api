module Resolvers
  module Common
    module SubCategories
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::SubCategoryType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
