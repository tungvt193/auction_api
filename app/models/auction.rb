# == Schema Information
#
# Table name: auctions
#
#  id           :bigint           unsigned, not null, primary key
#  name         :string(255)      not null
#  display_name :string(255)      default("")
#  started_at   :datetime
#  ended_at     :datetime
#  color        :string(255)
#  rating       :float(24)        default(0.0), not null
#  status       :integer          default("deactive"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Auction < ApplicationRecord
  enum status: { deactive: 0, active: 1 }

  has_many :images, as: :imageable
  has_many :bookings, dependent: :destroy
  has_many :auction_items, dependent: :destroy
  has_many :rates, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  ransacker :status, formatter: proc { |v| statuses[v] }

  def flutter_color
    '0xFF' + color.gsub('#', '')
  end

  def modified_display_name
    display_name + ' ' + try(:id).to_s
  end

  def update_average_rating
    value = rates.select { |item| item.ratable_type == 'AuctionItem' }.sum(&:star)
    total = rates.select { |item| item.ratable_type == 'AuctionItem' }.size

    return if total.zero?

    update!(rating: value.to_f / total)
  end
end
