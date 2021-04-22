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

module Types
  class AuctionType < BaseNode
    field :name,  String, null: true
    field :address,  String, null: true
    field :started_at, String, null: true
    field :code, String, null: true
    field :ended_at, String, null: true
    field :status, String, null: true
  end
end