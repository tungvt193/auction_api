module Types
  module Root
    # noinspection ALL
    module Common
      module MutationCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1CommonNewInformation, mutation: ::Mutations::Common::Users::NewInformation
          field :v1CommonUpdateProfile, mutation: ::Mutations::Common::Users::UpdateProfile
          field :v1CommonChangePassword, mutation: ::Mutations::Common::Users::ChangePassword
        end
      end
    end
  end
end
