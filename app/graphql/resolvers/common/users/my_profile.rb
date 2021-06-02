module Resolvers
  module Common
    module Users
      class MyProfile < ::Resolvers::BaseResolver
        type ::Types::UserType, null: false

        def resolve
          current_user
        end
      end
    end
  end
end
