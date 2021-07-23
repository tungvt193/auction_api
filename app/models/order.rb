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
  enum status: {
    pending: 0,
    jp_warehouse: 1,
    vn_transporting: 2,
    vn_warehouse: 3,
    waiting_delivery: 4,
    delivery: 5,
    delivered: 6
  }

  enum payment_type: { cash: 0, transfer: 1 }

  belongs_to :user
  has_many :order_items, dependent: :destroy

  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :payment_type, formatter: proc { |v| payment_types[v] }

  accepts_nested_attributes_for :order_items

  before_save :re_caculate_price
  before_create :generate_code

  after_commit :init_notification, on: :create
  after_commit :update_notification, on: :update

  def generate_code
    self.code = "BID-#{Time.zone.now.to_i}"
  end

  def init_notification
    MakeNotificationJob.perform_async('Order', status, id)
  end

  def update_notification
    return unless status_previously_changed?

    MakeNotificationJob.perform_async('Order', status, id)
  end

  def re_caculate_price
    self.price = order_items.sum(&:final_price)
  end
end
