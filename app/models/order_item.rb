# == Schema Information
#
# Table name: order_items
#
#  id                 :bigint           unsigned, not null, primary key
#  order_id           :bigint           not null
#  auction_item_id    :bigint           not null
#  auction_id         :bigint           not null
#  product_id         :bigint           not null
#  price              :float(24)        default(0.0), not null
#  quantity           :integer          default(1), not null
#  jpy_exrate         :float(24)        default(0.0), not null
#  usd_exrate         :float(24)        default(0.0), not null
#  vn_transport_fee   :float(24)        default(0.0), not null
#  clearance_fee      :float(24)        default(0.0), not null
#  estimated_fee      :float(24)        default(0.0), not null
#  imported_fee       :float(24)        default(0.0), not null
#  jp_to_vnd          :float(24)        default(0.0), not null
#  vat_tax            :float(24)        default(0.0), not null
#  bank_transport_fee :float(24)        default(0.0), not null
#  registry_fee       :float(24)        default(0.0), not null
#  total_price        :float(24)        default(0.0), not null
#  entrustment_fee    :float(24)        default(0.0), not null
#  final_price        :float(24)        default(0.0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :auction_item
  belongs_to :auction
end
