# == Schema Information
#
# Table name: sub_categories
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  category_id :bigint           not null
#  status      :integer          default("deactive"), not null
#  position    :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SubCategory < ApplicationRecord
  belongs_to :category

  enum status: { deactive: 0, active: 1 }

  ransacker :status, formatter: proc { |v| statuses[v] }
end
