# == Schema Information
#
# Table name: orders
#
#  id           :bigint           unsigned, not null, primary key
#  code         :string(255)      not null
#  cod_code     :string(255)
#  status       :integer          default("pending"), not null
#  user_id      :bigint           not null
#  payment_type :integer          default(0), not null
#  price        :bigint           default(0), not null
#  tax          :float(24)        default(0.0), not null
#  booking_at   :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

module Types
  class OrderType < BaseNode
    field :code, String, null: true
    field :cod_code, String, null: true
    field :status, String, null: true
    field :user_id, ID, null: false
    field :payment_type, String, null: true
    field :price, Int, null: true
    field :tax, Float, null: true
    field :booking_at, String, null: true

    field :order_items, [Types::OrderItemType], null: false, resolve: Lazy::LazyOrderItems.new
  end
end
