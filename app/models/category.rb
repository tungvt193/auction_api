# == Schema Information
#
# Table name: categories
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  thumb       :string(255)
#  thumb_tmp   :string(255)
#  status      :integer          default("deactive"), not null
#  category_id :string(255)
#  parent_id   :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  mount_uploader :thumb, ImageUploader

  enum status: { deactive: 0, active: 1 }

  has_many :products

  ransacker :status, formatter: proc { |v| statuses[v] }

  def thumb_url
    thumb.try(:url)
  end
end
