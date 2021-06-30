module Types
  class OrderSummaryType < BaseNode
    field :summary_type, String, null: false
    field :orders_total, Int, null: false
  end
end
