module Types
  module Root
    # noinspection ALL
    module Admin
      module MutationCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1AdminSignIn, mutation: ::Mutations::Admin::Authentication::SignIn
          field :v1AdminForgotPassword, mutation: ::Mutations::Admin::Authentication::ForgotPassword
          field :v1AdminResetPassword, mutation: ::Mutations::Admin::Authentication::ResetPassword
          field :v1AdminChangePassword, mutation: ::Mutations::Admin::Authentication::ChangePassword

          field :v1AdminCreateAuction, mutation: ::Mutations::Admin::Auctions::CreateAuction
          field :v1AdminUpdateAuction, mutation: ::Mutations::Admin::Auctions::UpdateAuction
          field :v1AdminDeleteAuction, mutation: ::Mutations::Admin::Auctions::DeleteAuction

          field :v1AdminCreateBooking, mutation: ::Mutations::Admin::Bookings::CreateBooking
          field :v1AdminUpdateBooking, mutation: ::Mutations::Admin::Bookings::UpdateBooking
          field :v1AdminDeleteBooking, mutation: ::Mutations::Admin::Bookings::DeleteBooking

          field :v1AdminCreateBanner, mutation: ::Mutations::Admin::Banners::CreateBanner
          field :v1AdminUpdateBanner, mutation: ::Mutations::Admin::Banners::UpdateBanner
          field :v1AdminDeleteBanner, mutation: ::Mutations::Admin::Banners::DeleteBanner

          field :v1AdminCreateCategory, mutation: ::Mutations::Admin::Categories::CreateCategory
          field :v1AdminUpdateCategory, mutation: ::Mutations::Admin::Categories::UpdateCategory
          field :v1AdminDeleteCategory, mutation: ::Mutations::Admin::Categories::DeleteCategory

          field :v1AdminCreateCompany, mutation: ::Mutations::Admin::Companies::CreateCompany
          field :v1AdminUpdateCompany, mutation: ::Mutations::Admin::Companies::UpdateCompany
          field :v1AdminDeleteCompany, mutation: ::Mutations::Admin::Companies::DeleteCompany

          field :v1AdminCreateImage, mutation: ::Mutations::Admin::Images::CreateImage
          field :v1AdminUpdateImage, mutation: ::Mutations::Admin::Images::UpdateImage
          field :v1AdminDeleteImage, mutation: ::Mutations::Admin::Images::DeleteImage

          field :v1AdminCreateNews, mutation: ::Mutations::Admin::News::CreateNews
          field :v1AdminUpdateNews, mutation: ::Mutations::Admin::News::UpdateNews
          field :v1AdminDeleteNews, mutation: ::Mutations::Admin::News::DeleteNews

          field :v1AdminCreateVideo, mutation: ::Mutations::Admin::Videos::CreateVideo
          field :v1AdminUpdateVideo, mutation: ::Mutations::Admin::Videos::UpdateVideo
          field :v1AdminDeleteVideo, mutation: ::Mutations::Admin::Videos::DeleteVideo

          field :v1AdminCreateUser, mutation: ::Mutations::Admin::Users::CreateUser
          field :v1AdminUpdateUser, mutation: ::Mutations::Admin::Users::UpdateUser
          field :v1AdminChangePasswordUser, mutation: ::Mutations::Admin::Users::ChangePasswordUser
          field :v1AdminUpdateProfile, mutation: ::Mutations::Admin::Users::UpdateProfile

          field :v1AdminCreateSubCategory, mutation: ::Mutations::Admin::SubCategories::CreateSubCategory
          field :v1AdminUpdateSubCategory, mutation: ::Mutations::Admin::SubCategories::UpdateSubCategory
          field :v1AdminDeleteSubCategory, mutation: ::Mutations::Admin::SubCategories::DeleteSubCategory

          field :v1AdminCreateOrder, mutation: ::Mutations::Admin::Orders::CreateOrder
          field :v1AdminUpdateOrder, mutation: ::Mutations::Admin::Orders::UpdateOrder
          field :v1AdminDeleteOrder, mutation: ::Mutations::Admin::Orders::DeleteOrder

          field :v1AdminCreateProduct, mutation: ::Mutations::Admin::Products::CreateProduct
          field :v1AdminUpdateProduct, mutation: ::Mutations::Admin::Products::UpdateProduct
          field :v1AdminDeleteProduct, mutation: ::Mutations::Admin::Products::DeleteProduct

          field :v1AdminDeleteRate, mutation: ::Mutations::Admin::Rates::DeleteRate
        end
      end
    end
  end
end
