# == Schema Information
#
# Table name: districts
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  province_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class District < ApplicationRecord
  has_many :wards, dependent: :destroy

  belongs_to :province
end
