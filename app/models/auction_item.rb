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
#  sub_category_id     :bigint
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
#  year_of_manufacture :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class AuctionItem < ApplicationRecord
  belongs_to :auction
  belongs_to :company
  belongs_to :category
  belongs_to :user, optional: true
  belongs_to :product

  has_many :bookings, dependent: :destroy
  has_many :rates, as: :ratable
  has_many :followers, as: :followable

  enum status: { pending: 0, progress: 1, sold: 2, unsold: 3, expired: 4 }

  scope :available, lambda {
    avaiable_query(
      {
        auction_ended_at_gteq: Time.zone.now
      },
      %w[pending progress]
    )
  }

  scope :unavailable, lambda {
    avaiable_query(
      {
        auction_ended_at_lteq: Time.zone.now
      },
      %w[sold expired]
    )
  }

  ransacker :status, formatter: proc { |v| statuses[v] }

  class << self
    def avaiable_query(time_query, query_statuses)
      where(user_id: nil).
        ransack({
                  m: 'or',
                  g: {
                    '0' => time_query,
                    '1' => {
                      status_in: query_statuses
                    }
                  }
                }).result
    end
  end

  def thumb_url
    images.split(',').try(:first)
  end

  def name
    "#{auction_name} #{marker}-#{serial}".upcase
  end

  def update_average_rating
    value = rates.sum(&:star)
    total = rates.size

    return if total.zero?

    update!(rating: (value.to_f / total).round(1))
  end
end
