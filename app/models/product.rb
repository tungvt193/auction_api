# == Schema Information
#
# Table name: products
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  thumb       :string(255)
#  thumb_tmp   :string(255)
#  code        :string(255)      not null
#  price       :float(24)        default(0.0), not null
#  keyword     :string(255)
#  company_id  :bigint           not null
#  category_id :bigint           not null
#  star        :float(24)        default(0.0), not null
#  star_total  :float(24)        default(0.0), not null
#  started_at  :datetime
#  status      :integer          default("deactive"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  mount_uploader :thumb, ImageUploader

  belongs_to :company
  
  enum status: [:deactive, :active, :popular]

  def thumb_url
    thumb.try(:url)
  end
end
