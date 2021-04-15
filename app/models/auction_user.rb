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
class AuctionUser < ApplicationRecord
end
