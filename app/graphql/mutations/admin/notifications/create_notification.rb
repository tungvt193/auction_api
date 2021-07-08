module Mutations
  module Admin
    module Notifications
      class CreateNotification < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::NotificationType, null: false

        def resolve(args)
          super

          resource = collection.new

          ApplicationRecord.transaction do
            attributes = decode_attributes(normalize_parameters)
            resource.assign_attributes(attributes)

            resource.save!
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :title, :message, :data, :user_id,
            :notification_type, :image_url
          )
        end
      end
    end
  end
end
