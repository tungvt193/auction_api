module Mutations
  module Common
    module Authentication
      class SignIn < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::AuthorizedType, null: false

        def resolve(args)
          super

          user = ::User.by_username_and_role(normalize_parameters[:username])
          repo = ::AuthRepository.new(nil, user)
          token = repo.sign_in(context, normalize_parameters)

          OpenStruct.new({
                           data: {
                             user: user,
                             token: token
                           }
                         })
        end

        private

        def normalize_parameters
          params.permit(:username, :password, :device_token)
        end
      end
    end
  end
end
