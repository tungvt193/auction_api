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
#  booking_at      :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Booking < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, success: 2, canceled: 3, failed: 4 }
  enum booking_type: { online: 0, offline: 1 }

  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :booking_type, formatter: proc { |v| booking_types[v] }

  belongs_to :user
  belongs_to :auction
  belongs_to :auction_item
end
