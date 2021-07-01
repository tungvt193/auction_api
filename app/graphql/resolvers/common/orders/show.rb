module Resolvers
  module Common
    module Orders
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::OrderType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
