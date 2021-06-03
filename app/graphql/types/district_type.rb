# == Schema Information
#
# Table name: districts
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  code        :string(255)      not null
#  province_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

module Types
  class DistrictType < BaseNode
    field :name, String, null: false
  end
end
