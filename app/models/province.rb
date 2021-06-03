# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Province < ApplicationRecord
  has_many :districts, dependent: :destroy
end
