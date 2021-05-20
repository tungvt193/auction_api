# == Schema Information
#
# Table name: rates
#
#  id           :bigint           unsigned, not null, primary key
#  ratable_type :string(255)      not null
#  ratable_id   :bigint           not null
#  user_id      :bigint           not null
#  comment      :text(65535)
#  star         :float(24)        default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Rate < ApplicationRecord
  belongs_to :ratable, polymorphic: true

  after_create :update_auction_rating

  def update_auction_rating
    ratable.update_average_rating
  end
end
