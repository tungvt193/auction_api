module Mutations
  module Admin
    module Authentication
      class ResetPassword < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::ResponseType, null: false

        def resolve(args)
          super
          raise ActiveRecord::RecordNotFound, 'Không tìm thấy tài khoản này!' if current_user.blank?
          raise ActionController::InvalidAuthenticityToken, 'Mật khẩu và mật khẩu xác nhận không trùng khớp!' if normalize_parameters[:new_password] != normalize_parameters[:confirm_new_password]

          ApplicationRecord.transaction do
            current_user.password = normalize_parameters[:new_password]
            current_user.save!
          end

          OpenStruct.new({
                           data: {
                             is_success: true,
                             message: 'Mật khẩu đã được thay đổi thành công!'
                           }
                         })
        end

        private

        def normalize_parameters
          params.permit(:new_password, :confirm_new_password)
        end
      end
    end
  end
end
