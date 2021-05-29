module Mutations
  module Common
    module Users
      class ChangePassword < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::UserType, null: false

        def resolve(args)
          super

          ApplicationRecord.transaction do
            attributes = normalize_parameters(args[:attribute])
            is_correctly = current_user.authenticate(attributes[:old_password])

            raise GraphQL::ExecutionError, 'Mật khẩu hiện tại không chính xác. Vui lòng nhập lại' unless is_correctly

            ApplicationRecord.transaction do
              current_user.password = attributes[:password]
              current_user.save!
            end
          end

          { data: current_user }
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(
            :password,
            :old_password
          )
        end
      end
    end
  end
end
