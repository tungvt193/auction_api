module Resolvers
  module Common
    module Users
      class ByUsername < ::Resolvers::BaseResolver
        argument :username, String, required: true
        type ::Types::UserType, null: true

        def resolve(username:)
          ::User.by_username_and_role(username)
        end
      end
    end
  end
end
