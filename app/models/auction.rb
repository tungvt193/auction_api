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
#  status              :integer          default("deactive"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Auction < ApplicationRecord
  enum status: [:deactive, :active]
end
