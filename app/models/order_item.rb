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
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :auction_item
  belongs_to :auction
end
