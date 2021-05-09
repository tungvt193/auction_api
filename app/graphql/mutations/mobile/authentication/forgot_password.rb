module Mutations
  module Mobile
    module Authentication
      class ForgotPassword < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::UserType, null: false

        def resolve(args)
          super

          attributes = normalize_parameters(args[:attribute])
          user = ::User.find_by(email: attributes[:email])

          raise GraphQL::ExecutionError, 'Không tìm thấy tài khoản sử dụng email này.' if user.blank?

          ::UserMailer.reset_password(user.try(:id)).deliver!

          OpenStruct.new({
                           data: {
                             is_sent: true,
                             email: attributes[:email],
                             message: 'Đường dẫn thay đổi mật khẩu đã được gửi đến hòm thư của bạn. Hãy kiểm tra và làm theo hướng dẫn'
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
