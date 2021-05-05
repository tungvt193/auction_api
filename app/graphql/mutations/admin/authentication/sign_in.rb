module Mutations
  module Admin
    module Authentication
      class SignIn < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::SignInType, null: false

        def resolve(args)
          super

          params = normalize_parameters(args)

          user = ::User.find_by(email: params[:username], role: 'admin')
          raise ActiveRecord::RecordNotFound, 'Username is incorrect!' if user.blank?

          raise ::ActionController::InvalidAuthenticityToken, 'Password is incorrect!' unless user.authenticate(params[:password])

          expired_at = 1.hour.from_now.strftime('%H:%M %d/%m/%Y')
          token = cryptor.encrypt_and_sign("user-id:#{user.id}&expired-at:#{expired_at}")

          context[:session][:token] = token

          user.assign_attributes({ last_sign_in_at: Time.zone.now })
          user.save!

          OpenStruct.new({
                           data: {
                             user: user,
                             token: token
                           }
                         })
        end

        private

        def normalize_parameters(args)
          ActionController::Parameters.new(args[:attribute].as_json).permit(:username, :password)
        end
      end
    end
  end
end
