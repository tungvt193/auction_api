module Resolvers
  module Common
    module News
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::NewsType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
