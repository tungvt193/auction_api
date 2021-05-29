module Types
  module Root
    # noinspection ALL
    module Web
      module MutationCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1WebSignIn, mutation: ::Mutations::Web::Authentication::SignIn
          field :v1WebForgotPassword, mutation: ::Mutations::Web::Authentication::ForgotPassword
          field :v1WebChangePassword, mutation: ::Mutations::Web::Authentication::ChangePassword

          field :v1WebCreateFollower, mutation: ::Mutations::Web::Followers::CreateFollower
          field :v1WebDeleteFollower, mutation: ::Mutations::Web::Followers::DeleteFollower
        end
      end
    end
  end
end
