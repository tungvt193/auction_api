module Mutations
  module Common
    module DeviceTokens
      class CreateDeviceToken < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::DeviceTokenType, null: false

        def resolve(args)
          super

          resource = collection.find_by(token: normalize_parameters[:token])

          if resource.blank?
            resource = collection.new({
                                        user_id: current_user.try(:id)
                                      })

            ApplicationRecord.transaction do
              attributes = decode_attributes(normalize_parameters)
              resource.assign_attributes(attributes)
              resource.token_type = current_user.present? ? 'anonymous' : 'owner'

              resource.save!
            end
          end

          { data: resource }
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:token)
        end
      end
    end
  end
end
