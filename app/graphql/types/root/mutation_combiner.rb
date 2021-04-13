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
      end
    end
  end
end
