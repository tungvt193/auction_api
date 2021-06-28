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
class Order < ApplicationRecord
  enum status: { pending: 0, success: 1, failed: 2, canceled: 3 }

  belongs_to :user
  has_many :order_items, dependent: :destroy
  ransacker :status, formatter: proc { |v| statuses[v] }

  accepts_nested_attributes_for :order_items
end
