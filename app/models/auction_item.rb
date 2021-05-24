# == Schema Information
#
# Table name: auction_items
#
#  id                  :bigint           unsigned, not null, primary key
#  product_name        :string(255)      not null
#  category_name       :string(255)      not null
#  auction_name        :string(255)      not null
#  status              :integer          default("pending"), not null
#  auction_id          :bigint           not null
#  product_id          :bigint           not null
#  category_id         :bigint           not null
#  company_id          :bigint           not null
#  price               :float(24)        default(0.0), not null
#  rating              :float(24)        default(0.0), not null
#  min_price           :float(24)        default(0.0), not null
#  marker              :string(255)      not null
#  serial              :string(255)      not null
#  address             :string(255)      not null
#  source_link         :string(255)
#  images              :json
#  user_id             :bigint
#  used_hours          :float(24)        default(0.0), not null
#  year_of_manufacture :datetime         not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class AuctionItem < ApplicationRecord
  belongs_to :auction
  belongs_to :user, optional: true

  has_many :bookings, dependent: :destroy
  has_many :rates, as: :ratable

  enum status: { pending: 0, progress: 1, sold: 2, unsold: 3, expired: 4 }

  def update_average_rating
    value = rates.sum(&:star)
    total = rates.size

    return if total.zero?

    update!(rating: value.to_f / total)
  end
end
