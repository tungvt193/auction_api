module Mutations
  module Common
    module Users
      class NewInformation < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, ::Types::AuthorizedType, null: false

        def resolve(args)
          super

          attributes = decode_attributes(normalize_parameters.except('confirmed_password', 'device_token'))

          raise ActionController::InvalidAuthenticityToken, 'Mật khẩu và mật khẩu xác nhận không trùng khớp!' if normalize_parameters[:password] != normalize_parameters[:confirmed_password]
          raise ActiveRecord::RecordNotFound, 'Không tìm thấy tài khoản này!' if current_user.blank?

          ApplicationRecord.transaction do
            current_user.assign_attributes(attributes.except('attributes'))
            current_user.assign_attributes(role: 'user', status: 'active')
            current_user.save!

            ::DeviceToken.create({
                                   token: normalize_parameters[:device_token],
                                   token_type: :owner,
                                   user_id: current_user.try(:id)
                                 })
          end

          OpenStruct.new({
                           data: {
                             user: current_user,
                             token: current_user.generate_token(Settings.token_time.normal.week)
                           }
                         })
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(
            :first_name, :last_name, :gender, :email,
            :password, :confirmed_password, :device_token
          )
        end
      end
    end
  end
end
