# == Schema Information
#
# Table name: auctions
#
#  id           :bigint           unsigned, not null, primary key
#  name         :string(255)      not null
#  display_name :string(255)
#  started_at   :datetime
#  ended_at     :datetime
#  color        :string(255)
#  rating       :float(24)        default(0.0), not null
#  status       :integer          default("deactive"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

module Types
  class AuctionType < BaseNode
    field :name, String, null: true
    field :modified_display_name, String, null: true
    field :color, String, null: true
    field :flutter_color, String, null: true
    field :rating, Float, null: false
    field :started_at, String, null: true
    field :ended_at, String, null: true
    field :status, String, null: true

    field :last_rate, Types::RateType, null: true, resolve: Lazy::LazyLastRate.new
    field :last_four_auction_items, [Types::AuctionItemType], null: true, resolve: Lazy::LazyLastFourAuctionItem.new
    field :auction_items, [Types::AuctionItemType], null: true, resolve: Lazy::LazyGetAllItemsByAuction.new
  end
end
