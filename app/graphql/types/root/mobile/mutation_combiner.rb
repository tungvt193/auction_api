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

          field :v1MobileCreateAuction, mutation: ::Mutations::Mobile::Auctions::CreateAuction
          field :v1MobileUpdateAuction, mutation: ::Mutations::Mobile::Auctions::UpdateAuction
          field :v1MobileDeleteAuction, mutation: ::Mutations::Mobile::Auctions::DeleteAuction

          field :v1MobileCreateBanner, mutation: ::Mutations::Mobile::Banners::CreateBanner
          field :v1MobileUpdateBanner, mutation: ::Mutations::Mobile::Banners::UpdateBanner
          field :v1MobileDeleteBanner, mutation: ::Mutations::Mobile::Banners::DeleteBanner

          field :v1MobileCreateCategory, mutation: ::Mutations::Mobile::Categories::CreateCategory
          field :v1MobileUpdateCategory, mutation: ::Mutations::Mobile::Categories::UpdateCategory
          field :v1MobileDeleteCategory, mutation: ::Mutations::Mobile::Categories::DeleteCategory

          field :v1MobileCreateCompany, mutation: ::Mutations::Mobile::Companies::CreateCompany
          field :v1MobileUpdateCompany, mutation: ::Mutations::Mobile::Companies::UpdateCompany
          field :v1MobileDeleteCompany, mutation: ::Mutations::Mobile::Companies::DeleteCompany

          field :v1MobileCreateImage, mutation: ::Mutations::Mobile::Images::CreateImage
          field :v1MobileUpdateImage, mutation: ::Mutations::Mobile::Images::UpdateImage
          field :v1MobileDeleteImage, mutation: ::Mutations::Mobile::Images::DeleteImage

          field :v1MobileCreateNews, mutation: ::Mutations::Mobile::News::CreateNews
          field :v1MobileUpdateNews, mutation: ::Mutations::Mobile::News::UpdateNews
          field :v1MobileDeleteNews, mutation: ::Mutations::Mobile::News::DeleteNews

          field :v1MobileCreateVideo, mutation: ::Mutations::Mobile::Videos::CreateVideo
          field :v1MobileUpdateVideo, mutation: ::Mutations::Mobile::Videos::UpdateVideo
          field :v1MobileDeleteVideo, mutation: ::Mutations::Mobile::Videos::DeleteVideo
        end
      end
    end
  end
end
