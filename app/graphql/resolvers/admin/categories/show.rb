module Resolvers
  module Admin
    module Categories
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::CategoryType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
