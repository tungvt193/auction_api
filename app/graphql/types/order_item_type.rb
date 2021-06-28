# == Schema Information
#
# Table name: order_items
#
#  id              :bigint           unsigned, not null, primary key
#  order_id        :bigint           not null
#  auction_item_id :bigint           not null
#  auction_id      :bigint           not null
#  product_id      :bigint           not null
#  price           :float(24)        default(0.0), not null
#  status          :integer          default(0), not null
#  quantity        :integer          default(1), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module Types
  class OrderItemType < BaseNode
    field :order_id, ID, null: false
    field :auction_item_id, ID, null: false
    field :auction_id, ID, null: false
    field :product_id, ID, null: false
    field :payment_type, String, null: true
    field :price, Float, null: true
    field :status, String, null: true
    field :quantity, Int, null: true

    field :order, Types::OrderType, null: true, resolve: Lazy::LazyOrder.new
    field :product, Types::OrderType, null: true, resolve: Lazy::LazyProduct.new
    field :auction, Types::OrderType, null: true, resolve: Lazy::LazyAuction.new
    field :auction_item, Types::OrderType, null: true, resolve: Lazy::LazyAuctionItem.new
  end
end