module Mutations
  module Admin
    module Authentication
      class ForgotPassword < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::ResponseType, null: false

        def resolve(args)
          super

          user = ::User.find_by(email: normalize_parameters[:email].downcase, role: 'admin')
          raise GraphQL::ExecutionError, 'Không tìm thấy tài khoản sử dụng email này.' if user.blank?
          ::EmailRepository.new(nil, user).forgot_password

          OpenStruct.new({
                           data: {
                             is_success: true,
                             message: 'Yêu cầu thay đổi lại mật khẩu đã được gửi tới email của bạn, vui lòng kiểm tra mail!'
                           }
                         })
        end

        private

        def normalize_parameters
          params.permit(:email)
        end
      end
    end
  end
end
