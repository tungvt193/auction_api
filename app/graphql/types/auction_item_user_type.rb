# == Schema Information
#
# Table name: auction_users
#
#  id         :bigint           unsigned, not null, primary key
#  auction_id :bigint           not null
#  user_id    :bigint           not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Types
  class AuctionItemUserType < BaseNode
    field :auction_id, Types::GraphqlIdType, null: false
    field :user_id, Types::GraphqlIdType, null: false
    field :status, String, null: false

    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
    field :auction, Types::AuctionType, null: true, resolve: Lazy::LazyAuction.new
    field :auction_item, Types::AuctionItemType, null: true, resolve: Lazy::LazyAuctionItem.new
  end
end
