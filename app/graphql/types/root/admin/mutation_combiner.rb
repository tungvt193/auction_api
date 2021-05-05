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
          field :v1AdminChangePassword, mutation: ::Mutations::Admin::Authentication::ChangePassword
        end
      end
    end
  end
end
