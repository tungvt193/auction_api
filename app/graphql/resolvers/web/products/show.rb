module Resolvers
  module Web
    module Products
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::ProductType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
