module Types
  module Root
    # noinspection ALL
    module MutationCombiner
      extend ActiveSupport::Concern

      # CRUD
      included do
        field :v1SignIn, mutation: ::Mutations::Authentication::SignIn
        field :v1ForgotPassword, mutation: ::Mutations::Authentication::ForgotPassword
        field :v1ChangePassword, mutation: ::Mutations::Authentication::ChangePassword

        field :v1CreateAuctionItemUser, mutation: ::Mutations::AuctionItemUsers::CreateAuctionItemUser
        field :v1UpdateAuctionItemUser, mutation: ::Mutations::AuctionItemUsers::UpdateAuctionItemUser
        field :v1DeleteAuctionItemUser, mutation: ::Mutations::AuctionItemUsers::DeleteAuctionItemUser

        field :v1CreateAuction, mutation: ::Mutations::Auctions::CreateAuction
        field :v1UpdateAuction, mutation: ::Mutations::Auctions::UpdateAuction
        field :v1DeleteAuction, mutation: ::Mutations::Auctions::DeleteAuction

        field :v1CreateBanner, mutation: ::Mutations::Banners::CreateBanner
        field :v1UpdateBanner, mutation: ::Mutations::Banners::UpdateBanner
        field :v1DeleteBanner, mutation: ::Mutations::Banners::DeleteBanner

        field :v1CreateCategory, mutation: ::Mutations::Categories::CreateCategory
        field :v1UpdateCategory, mutation: ::Mutations::Categories::UpdateCategory
        field :v1DeleteCategory, mutation: ::Mutations::Categories::DeleteCategory

        field :v1CreateCompany, mutation: ::Mutations::Companies::CreateCompany
        field :v1UpdateCompany, mutation: ::Mutations::Companies::UpdateCompany
        field :v1DeleteCompany, mutation: ::Mutations::Companies::DeleteCompany

        field :v1CreateImage, mutation: ::Mutations::Images::CreateImage
        field :v1UpdateImage, mutation: ::Mutations::Images::UpdateImage
        field :v1DeleteImage, mutation: ::Mutations::Images::DeleteImage

        field :v1CreateNews, mutation: ::Mutations::News::CreateNews
        field :v1UpdateNews, mutation: ::Mutations::News::UpdateNews
        field :v1DeleteNews, mutation: ::Mutations::News::DeleteNews

        field :v1CreateVideo, mutation: ::Mutations::Videos::CreateVideo
        field :v1UpdateVideo, mutation: ::Mutations::Videos::UpdateVideo
        field :v1DeleteVideo, mutation: ::Mutations::Videos::DeleteVideo
      end
    end
  end
end
