module Mutations
  module Web
    module Authentication
      class SignIn < BaseMutation
        graphql_name 'WebSignIn'
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::AuthorizedType, null: false

        def resolve(args)
          super

          params = normalize_parameters(args)

          user = ::User.by_username_and_role(params[:username])
          raise ActiveRecord::RecordNotFound, 'Username is incorrect!' if user.blank?

          raise ::ActionController::InvalidAuthenticityToken, 'Password is incorrect!' unless user.authenticate(params[:password])

          token = user.generate_token(Settings.login_session_expiration_time_hour.hour)
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
          ::ActionController::Parameters.new(args[:attribute].as_json).permit(:username, :password)
        end
      end
    end
  end
end
