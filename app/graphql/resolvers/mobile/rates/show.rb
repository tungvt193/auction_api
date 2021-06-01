module Resolvers
  module Mobile
    module Rates
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::RateType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
