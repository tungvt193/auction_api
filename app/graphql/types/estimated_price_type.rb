module Types
  class EstimatedPriceType < BaseNode
    field :jpy_exrate, Float, null: true, default_value: 0.0
    field :usd_exrate, Float, null: true, default_value: 0.0
    field :vn_transport_fee, Float, null: true, default_value: 0.0
    field :clearance_fee, Float, null: true, default_value: 0.0
    field :estimated_fee, Float, null: true, default_value: 0.0
    field :imported_fee, Float, null: true, default_value: 0.0
    field :jp_to_vnd, Float, null: true, default_value: 0.0
    field :vat_tax, Float, null: true, default_value: 0.0
    field :bank_transport_fee, Float, null: true, default_value: 0.0
    field :registry_fee, Float, null: true, default_value: 0.0
    field :total_price, Float, null: true, default_value: 0.0
    field :entrustment_fee, Float, null: true, default_value: 0.0
    field :final_price, Float, null: true, default_value: 0.0
  end
end
