module Mutations
  module Admin
    module Authentication
      class ForgotPassword < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::ResponseType, null: false

        def resolve(args)
          super

          attributes = normalize_parameters(args[:attribute])
          user = ::User.find_by(email: attributes[:email].downcase, role: 'admin')

          raise GraphQL::ExecutionError, 'Not found account using this email' if user.blank?

          ::EmailRepository.new(nil, user).forgot_password

          OpenStruct.new({
                           data: {
                             is_success: true,
                             message: 'Yêu cầu thay đổi lại mật khẩu đã được gửi tới email của bạn, vui lòng kiểm tra mail!'
                           }
                         })
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(:email)
        end
      end
    end
  end
end
