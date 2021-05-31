module Types
  module Root
    # noinspection ALL
    module Web
      module MutationCombiner
        extend ActiveSupport::Concern

        # CRUD
        included do
          field :v1WebCreateFollower, mutation: ::Mutations::Web::Followers::CreateFollower
          field :v1WebDeleteFollower, mutation: ::Mutations::Web::Followers::DeleteFollower
        end
      end
    end
  end
end
