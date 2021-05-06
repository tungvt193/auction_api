module Resolvers
  module Common
    module Videos
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::VideoType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
