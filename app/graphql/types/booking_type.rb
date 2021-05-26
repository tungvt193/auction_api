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
module Types
  class BookingType < BaseNode
    field :status, String, null: true
    field :booking_type, String, null: true
    field :address, String, null: true
    field :zoom_id, String, null: true
    field :zoom_password, String, null: true
    field :booking_at, String, null: false

    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
    field :auction, Types::AuctionType, null: true, resolve: Lazy::LazyAuction.new
    field :auction_item, Types::AuctionItemType, null: true, resolve: Lazy::LazyAuctionItem.new
  end
end
