module Mutations
  module Common
    module Users
      class NewInformation < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::AuthorizedType, null: false

        def resolve(args)
          super

          encode_attributes = normalize_parameters(args[:attribute])
          attributes = decode_attributes(encode_attributes.except('confirmed_password'))

          raise ActionController::InvalidAuthenticityToken, 'Mật khẩu và mật khẩu xác nhận không trùng khớp!' if encode_attributes[:password] != encode_attributes[:confirmed_password]
          raise ActiveRecord::RecordNotFound, 'Không tìm thấy tài khoản này!' if current_user.blank?

          ApplicationRecord.transaction do
            current_user.assign_attributes(attributes)
            current_user.assign_attributes(role: 'user', status: 'active')
            current_user.save!
          end

          OpenStruct.new({
                           data: {
                             user: current_user,
                             token: current_user.generate_token(Settings.expired_time_otp_minute.minutes)
                           }
                         })
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(
            :first_name, :last_name, :gender, :email, :password, :confirmed_password
          )
        end
      end
    end
  end
end
