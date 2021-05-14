module Types
  class AuthorizedType < GraphQL::Schema::Object
    description 'Authorized Types'

    field :user, Types::UserType, null: false
    field :token, String, null: true
  end
end
