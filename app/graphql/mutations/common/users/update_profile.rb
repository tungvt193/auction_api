module Mutations
  module Common
    module Users
      class UpdateProfile < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::UserType, null: false

        def resolve(args)
          super

          encode_attributes = normalize_parameters(args[:attribute])
          attributes = decode_attributes(encode_attributes)

          ApplicationRecord.transaction do
            current_user.assign_attributes(attributes)
            current_user.save!
          end

          { data: current_user }
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(
            :first_name, :last_name, :email, :avatar_url, :gender
          )
        end
      end
    end
  end
end
