# == Schema Information
#
# Table name: wards
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  district_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Ward < ApplicationRecord
  belongs_to :district
end
