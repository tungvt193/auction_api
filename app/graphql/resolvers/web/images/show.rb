module Resolvers
  module Web
    module Images
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::ImageType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
