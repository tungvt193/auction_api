# == Schema Information
#
# Table name: auctions
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  code       :string(255)      not null
#  started_at :datetime
#  ended_at   :datetime
#  status     :integer          default("deactive"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Auction < ApplicationRecord
  enum status: [:deactive, :active]
  
  has_many :images, as: :imageable

  accepts_nested_attributes_for :images, allow_destroy: true
end
