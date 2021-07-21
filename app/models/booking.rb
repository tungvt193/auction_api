# == Schema Information
#
# Table name: bookings
#
#  id              :bigint           unsigned, not null, primary key
#  auction_item_id :bigint           not null
#  auction_id      :bigint           not null
#  status          :integer          default("pending"), not null
#  user_id         :bigint           not null
#  booking_type    :integer          default("online"), not null
#  address         :string(255)
#  zoom_id         :string(255)
#  zoom_password   :string(255)
#  supporter_id    :bigint
#  price           :float(24)        default(0.0), not null
#  deposit_type    :integer          default("cash"), not null
#  payment_type    :integer          default("pay_before"), not null
#  booking_at      :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  canceled_reason :text(65535)
#
class Booking < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, success: 2, canceled: 3, failed: 4 }
  enum booking_type: { online: 0, offline: 1 }
  enum deposit_type: { cash: 0, transfer: 1 }
  enum payment_type: { pay_before: 0, pay_after: 1 }

  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :booking_type, formatter: proc { |v| booking_types[v] }
  ransacker :deposit_type, formatter: proc { |v| deposit_types[v] }
  ransacker :payment_type, formatter: proc { |v| payment_types[v] }

  belongs_to :user
  belongs_to :auction
  belongs_to :auction_item

  before_commit :auto_address, on: [:create, :update]
  after_commit :init_notification, on: :create
  after_commit :update_notification, on: :update

  def is_default_address?
    try(:offline?) && try(:address).try(:blank?)
  end

  def is_expired
    return false if booking_at.blank?

    booking_at < Time.zone.now
  end

  def is_today
    return false if booking_at.blank?

    booking_at.between?(beginning_of_day, end_of_day)
  end

  def format_booking_at
    booking_at.try(:strftime, '%H:%M %d/%m/%Y')
  end

  def beginning_of_day
    Time.zone.now.beginning_of_day
  end

  def end_of_day
    Time.zone.now.end_of_day
  end

  def init_notification
    MakeNotificationJob.perform_async('Booking', status, id)
  end

  def update_notification
    return unless status_previously_changed?

    MakeNotificationJob.perform_async('Booking', status, id)
  end

  private

  def auto_address
    self.address = '18 Tôn Thất Thuyết, Mỹ Đình, Cầu Giấy, Hà Nội' if address.blank?
  end
end
