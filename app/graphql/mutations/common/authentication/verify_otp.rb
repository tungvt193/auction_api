module Mutations
  module Common
    module Authentication
      class VerifyOtp < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::AuthorizedType, null: false

        def resolve(args)
          super

          user, token = repo.verify_otp(normalize_parameters)

          OpenStruct.new({
                           data: {
                             user: user,
                             token: token
                           }
                         })
        end

        private

        def normalize_parameters
          params.require(:attribute).permit(:code, :verification_id)
        end

        def repo
          ::AuthRepository.new(nil, nil)
        end
      end
    end
  end
end
