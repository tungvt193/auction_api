# == Schema Information
#
# Table name: bookings
#
#  id              :bigint           unsigned, not null, primary key
#  auction_item_id :bigint           not null
#  auction_id      :bigint           not null
#  status          :integer          default("pending"), not null
#  user_id         :bigint           not null
#  supporter_id    :bigint
#  booking_at      :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Booking < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, success: 2, canceled: 3, failed: 4 }

  belongs_to :user
  belongs_to :auction
  belongs_to :auction_item
end
