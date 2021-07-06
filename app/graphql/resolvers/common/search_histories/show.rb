module Resolvers
  module Common
    module SearchHistories
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::SearchHistoryType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
