module Types
  class ScoreType < BaseNode
    field :five, Int, null: false, default_value: 0
    field :four, Int, null: false, default_value: 0
    field :three, Int, null: false, default_value: 0
    field :two, Int, null: false, default_value: 0
    field :one, Int, null: false, default_value: 0
  end
end
