# == Schema Information
#
# Table name: orders
#
#  id           :bigint           unsigned, not null, primary key
#  code         :string(255)      not null
#  cod_code     :string(255)
#  status       :integer          default("pending"), not null
#  user_id      :bigint           not null
#  payment_type :integer          default("cash"), not null
#  price        :float(24)        default(0.0), not null
#  tax          :float(24)        default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Order < ApplicationRecord
  enum status: { pending: 0, success: 1, failed: 2, canceled: 3 }
  enum payment_type: { cash: 0, transfer: 1 }

  belongs_to :user
  has_many :order_items, dependent: :destroy

  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :payment_type, formatter: proc { |v| payment_types[v] }

  accepts_nested_attributes_for :order_items

  before_commit :generate_code, on: :create

  def generate_code
    self.code = "BID-#{Time.zone.now.to_i}"
  end
end
