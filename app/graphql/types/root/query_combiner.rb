module Types
  module Root
    # noinspection ALL
    module QueryCombiner
      extend ActiveSupport::Concern

      # CRUD
      included do
        field :v1UserList, ::Connections::UserConnection,
              function: ::Resolvers::Users::List, null: true, connection: true
        field :v1User, resolver: ::Resolvers::Users::Show
      end
    end
  end
end
