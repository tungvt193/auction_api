module Mutations
  module Authentication
    class SignIn < BaseMutation
      argument :attribute, Types::AttributeType, required: true
      field :data, Types::SignInType, null: false

      def resolve(args)
        super

        params = normalize_parameters(args)

        user = ::User.find_by email: params[:email]
        raise ActiveRecord::RecordNotFound, 'Username is incorrect!' if user.blank?

        unless user.authenticate(params[:password])
          raise ::ActionController::InvalidAuthenticityToken.new('Password is incorrect!')
        end

        # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
        expired_at = 1.hour.from_now.strftime('%H:%M %d/%m/%Y')
        token = crypt.encrypt_and_sign("user-id:#{user.id}&expired_at:#{expired_at}")

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
        ActionController::Parameters.new(args[:attribute].as_json).permit(:email, :password)
      end
    end
  end
end
