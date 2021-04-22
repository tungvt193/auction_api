# == Schema Information
#
# Table name: auction_item_users
#
#  id              :bigint           unsigned, not null, primary key
#  auction_id      :bigint           not null
#  auction_item_id :bigint           not null
#  user_id         :bigint           not null
#  status          :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class AuctionItemUser < ApplicationRecord
  belongs_to :auction_item
  belongs_to :user
end
