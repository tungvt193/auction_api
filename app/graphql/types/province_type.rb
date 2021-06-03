# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  code       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Types
  class ProvinceType < BaseNode
    field :name, String, null: false
  end
end
