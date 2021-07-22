module Types
  class BadgeType < BaseNode
    field :message, String, null: true
    field :badge, Int, null: true
  end
end
