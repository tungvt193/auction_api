module Resolvers
  module Common
    module Notifications
      class Show < ::Resolvers::BaseResolver
        argument :id, ID, required: true
        type ::Types::NotificationType, null: false

        def resolve(id:)
          record = super

          return record if current_user.blank?
          return record if record.is_readed?(current_user)

          record.read_by!(current_user)
          record
        end
      end
    end
  end
end
