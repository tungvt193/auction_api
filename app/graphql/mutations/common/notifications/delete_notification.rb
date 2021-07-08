module Mutations
  module Common
    module Notifications
      class DeleteNotification < BaseMutation
        argument :id, ID, required: true
        field :data, ::Types::NotificationType, null: false

        def resolve(args)
          super

          resource = object_from_id(args[:id])
          resource.remove_by!(current_user)

          { data: resource }
        end
      end
    end
  end
end
