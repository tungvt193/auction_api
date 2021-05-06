module Types
  module Root
    # noinspection ALL
    module Mobile
      module MutationCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1MobileSignIn, mutation: ::Mutations::Mobile::Authentication::SignIn
          field :v1MobileForgotPassword, mutation: ::Mutations::Mobile::Authentication::ForgotPassword
          field :v1MobileChangePassword, mutation: ::Mutations::Mobile::Authentication::ChangePassword

          field :v1MobileCreateAuctionItemUser, mutation: ::Mutations::Mobile::AuctionItemUsers::CreateAuctionItemUser
          field :v1MobileUpdateAuctionItemUser, mutation: ::Mutations::Mobile::AuctionItemUsers::UpdateAuctionItemUser
          field :v1MobileDeleteAuctionItemUser, mutation: ::Mutations::Mobile::AuctionItemUsers::DeleteAuctionItemUser

          field :v1MobileCreateImage, mutation: ::Mutations::Mobile::Images::CreateImage
          field :v1MobileUpdateImage, mutation: ::Mutations::Mobile::Images::UpdateImage
          field :v1MobileDeleteImage, mutation: ::Mutations::Mobile::Images::DeleteImage
        end
      end
    end
  end
end
