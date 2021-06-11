module Types
  class EstimatedPriceType < BaseNode
    field :entrust_fee, Float, null: false
    field :japan_port_fee, Float, null: false
    field :release_fee, Float, null: false
    field :import_tax, Float, null: false
    field :vat_tax, Float, null: false
  end
end
