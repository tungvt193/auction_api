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

          field :v1CommonUsersFollow, mutation: ::Mutations::Common::Users::Follow

          field :v1CommonCreateBooking, mutation: ::Mutations::Common::Bookings::CreateBooking
          field :v1CommonUpdateBooking, mutation: ::Mutations::Common::Bookings::UpdateBooking
          field :v1CommonDeleteBooking, mutation: ::Mutations::Common::Bookings::DeleteBooking

          field :v1CommonCreateSearchHistory, mutation: ::Mutations::Common::SearchHistories::CreateSearchHistory
          field :v1CommonDeleteSearchHistory, mutation: ::Mutations::Common::SearchHistories::DeleteSearchHistory

          field :v1CommonDeleteNotification, mutation: ::Mutations::Common::Notifications::DeleteNotification
          field :v1CommonCreateDeviceToken, mutation: ::Mutations::Common::DeviceTokens::CreateDeviceToken
        end
      end
    end
  end
end
