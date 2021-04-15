# == Schema Information
#
# Table name: rates
#
#  id           :bigint           unsigned, not null, primary key
#  ratable_type :string(255)      not null
#  ratable_id   :bigint           not null
#  user_id      :bigint           not null
#  comment      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Rate < ApplicationRecord
end
