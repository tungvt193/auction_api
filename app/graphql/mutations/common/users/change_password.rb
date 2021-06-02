module Mutations
  module Common
    module Users
      class ChangePassword < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::UserType, null: false

        def resolve(args)
          super

          ApplicationRecord.transaction do
            is_correctly = current_user.authenticate(normalize_parameters[:old_password])

            raise GraphQL::ExecutionError, 'Mật khẩu hiện tại không chính xác. Vui lòng nhập lại' unless is_correctly

            ApplicationRecord.transaction do
              current_user.password = normalize_parameters[:password]
              current_user.save!
            end
          end

          { data: current_user }
        end

        private

        def normalize_parameters
          params.permit(:password, :old_password)
        end
      end
    end
  end
end
