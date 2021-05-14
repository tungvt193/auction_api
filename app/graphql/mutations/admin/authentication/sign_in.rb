module Mutations
  module Admin
    module Authentication
      class SignIn < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::AuthorizedType, null: false

        def resolve(args)
          super

          params = normalize_parameters(args)
          user = ::User.by_username_and_role(params[:username], 'admin')
          repo = ::AuthRepository.new(nil, user)
          token = repo.sign_in(context, params)

          OpenStruct.new({
                           data: {
                             user: user,
                             token: token
                           }
                         })
        end

        private

        def normalize_parameters(args)
          ActionController::Parameters.new(args[:attribute].as_json).permit(:username, :password, :device_token)
        end
      end
    end
  end
end
