module Types
  module Root
    # noinspection ALL
    module Common
      module MutationCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1CommonSignIn, mutation: ::Mutations::Common::Authentication::SignIn
          field :v1CommonChangePassword, mutation: ::Mutations::Common::Authentication::ChangePassword
          field :v1CommonResetPassword, mutation: ::Mutations::Common::Authentication::ResetPassword
          field :v1CommonVerifyOtp, mutation: ::Mutations::Common::Authentication::VerifyOtp

          field :v1CommonNewInformation, mutation: ::Mutations::Common::Users::NewInformation
          field :v1CommonUpdateProfile, mutation: ::Mutations::Common::Users::UpdateProfile
        end
      end
    end
  end
end
