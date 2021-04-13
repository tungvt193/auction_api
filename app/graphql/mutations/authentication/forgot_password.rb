module Mutations
  module Authentication
    class ForgotPassword < BaseMutation
      argument :attribute, Types::AttributeType, required: true
      field :data, Types::UserType, null: false

      def resolve(args)
        super

        attributes = normalize_parameters(args[:attribute])
        user = ::User.find_by(email: attributes[:email])

        raise GraphQL::ExecutionError, 'Not found account using this email' if  user.blank?
        ::UserMailer.reset_password(admin.try(:id)).deliver!

        OpenStruct.new({
                         data: {
                           is_sent: true,
                           email: attributes[:email],
                           message: 'Please check inbox the email!'
                         }
                       })
      end

      private

      def normalize_parameters(args)
        ::ActionController::Parameters.new(args.as_json).permit(:email)
      end
    end
  end
end
