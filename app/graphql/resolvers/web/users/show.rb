module Resolvers
  module Web
    module Users
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::UserType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end
