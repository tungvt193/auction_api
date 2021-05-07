module Types
  ResponseType = GraphQL::ObjectType.define do
    name 'ResponseType'

    field :message, types.String
    field :is_success, types.Boolean
  end
end
