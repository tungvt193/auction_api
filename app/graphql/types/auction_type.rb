# == Schema Information
#
# Table name: auctions
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  started_at :datetime
#  ended_at   :datetime
#  rating     :float(24)        default(0.0), not null
#  status     :integer          default("deactive"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Types
  class AuctionType < BaseNode
    field :name, String, null: true
    field :rating, Float, null: false
    field :started_at, String, null: true
    field :ended_at, String, null: true
    field :status, String, null: true

    field :last_rate, Types::RateType, null: true, resolve: Lazy::LazyLastRate.new
    field :last_four_auction_item, [Types::AuctionItemType], null: true, resolve: Lazy::LazyLastFourAuctionItem.new
  end
end
