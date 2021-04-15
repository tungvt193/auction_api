# == Schema Information
#
# Table name: categories
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  status     :integer          default("deactive"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  enum status: [:deactive, :active]
end
