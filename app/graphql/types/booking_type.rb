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
#  deposit         :float(24)        default(0.0), not null
#  deposit_type    :integer          default("cash"), not null
#  payment_type    :integer          default("pay_before"), not null
#  booking_at      :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
module Types
  class BookingType < BaseNode
    field :status, String, null: true
    field :booking_type, String, null: true
    field :address, String, null: true
    field :zoom_id, String, null: true
    field :zoom_password, String, null: true
    field :booking_at, String, null: false
    field :is_expired, Boolean, null: false
    field :is_today, Boolean, null: false
    field :deposit, Float, null: false
    field :deposit_type, String, null: true
    field :payment_type, String, null: true

    field :name, String, null: true, resolve: Lazy::LazyBookingName.new
    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
    field :auction, Types::AuctionType, null: true, resolve: Lazy::LazyAuction.new
    field :auction_item, Types::AuctionItemType, null: true, resolve: Lazy::LazyAuctionItem.new
  end
end
