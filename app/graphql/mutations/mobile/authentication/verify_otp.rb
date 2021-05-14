module Mutations
  module Mobile
    module Authentication
      class VerifyOtp < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::AuthorizedType, null: false

        def resolve(args)
          super

          params = normalize_parameters(args[:attribute])
          user, token = repo.verify_otp(params)

          OpenStruct.new({
                           data: {
                             user: user,
                             token: token
                           }
                         })
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(:code, :verification_id)
        end

        def repo
          ::AuthRepository.new(nil, nil)
        end
      end
    end
  end
end
