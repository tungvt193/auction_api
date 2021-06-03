# == Schema Information
#
# Table name: wards
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  code        :string(255)      not null
#  district_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

module Types
  class WardType < BaseNode
    field :name, String, null: false
  end
end
