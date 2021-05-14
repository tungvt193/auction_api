module Mutations
  module Mobile
    module Authentication
      class VerifyOtp < BaseMutation
        argument :attribute, Types::AttributeType, required: true
        field :data, Types::ResponseType, null: false

        def resolve(args)
          super

          params = normalize_parameters(args[:attribute])
          token = ::AuthRepository.new(nil, nil).verify_otp(context, params)

          OpenStruct.new({
                           data: {
                             is_success: true,
                             message: 'Xác thực OTP thành công!',
                             token: token
                           }
                         })
        end

        private

        def normalize_parameters(args)
          ::ActionController::Parameters.new(args.as_json).permit(:code, :verification_id)
        end
      end
    end
  end
end
