module Types
  class BookingSummaryType < BaseNode
    field :summary_type, String, null: false
    field :bookings_total, Int, null: false
  end
end
