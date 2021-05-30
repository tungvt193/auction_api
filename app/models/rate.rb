# == Schema Information
#
# Table name: rates
#
#  id           :bigint           unsigned, not null, primary key
#  ratable_type :string(255)      not null
#  ratable_id   :bigint           not null
#  user_id      :bigint           not null
#  auction_id   :bigint
#  comment      :text(65535)
#  star         :float(24)        default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Rate < ApplicationRecord
  belongs_to :auction
  belongs_to :ratable, polymorphic: true

  after_commit :update_auction_rating

  def update_auction_rating
    RatingJob.perform_async(id)
  end

  def rounded_star
    star.to_i.to_s
  end
end
