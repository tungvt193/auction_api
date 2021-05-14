module Types
  class ResponseType < BaseNode
    field :message, String, null: true
    field :is_success, Boolean, null: true
    field :token, String, null: true
  end
end
