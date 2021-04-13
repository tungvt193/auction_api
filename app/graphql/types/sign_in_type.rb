module Types
  class SignInType < GraphQL::Schema::Object
    description 'Signin Types'

    field :user, Types::UserType, null: false
    field :token, String, null: true
  end
end
