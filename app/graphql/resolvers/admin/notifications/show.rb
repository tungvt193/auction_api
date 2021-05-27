module Resolvers
  module Admin
    module Notifications
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::NotificationType, null: false

        def resolve(id:)
          super
        end
      end
    end
  end
end