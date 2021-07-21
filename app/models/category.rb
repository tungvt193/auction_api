# == Schema Information
#
# Table name: categories
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  en_name    :string(255)      not null
#  ja_name    :string(255)      not null
#  thumb      :string(255)
#  thumb_tmp  :string(255)
#  slug       :string(255)      not null
#  status     :integer          default("deactive"), not null
#  position   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  mount_uploader :thumb, ImageUploader
  store_in_background :thumb

  enum status: { deactive: 0, active: 1 }
  has_many :auction_items, dependent: :destroy
  has_many :products

  ransacker :status, formatter: proc { |v| statuses[v] }

  def thumb_url
    thumb.try(:url)
  end

  def slug_generator
    self.slug = name.downcase.tr(VIETNAMESE_CHARACTERS, ENGLISH_CHARACTERS).parameterize.truncate 80, omission: ''
  end
end
