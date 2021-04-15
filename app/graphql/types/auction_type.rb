# == Schema Information
#
# Table name: auctions
#
#  id                  :bigint           unsigned, not null, primary key
#  name                :string(255)      not null
#  used_hours          :float(24)        default(0.0), not null
#  year_of_manufacture :datetime         not null
#  address             :string(255)      not null
#  min_price           :float(24)        default(0.0), not null
#  started_at          :datetime
#  ended_at            :datetime
#  status              :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

module Types
  class AuctionType < BaseNode
    field :name,  String, null: true
    field :used_hours, Int, null: false
    field :year_of_manufacture, String, null: false
    field :address,  String, null: true
    field :min_price, Int, null: false
    field :started_at, String, null: true
    field :ended_at, String, null: true
    field :status, String, null: true
  end
end