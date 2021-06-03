# == Schema Information
#
# Table name: products
#
#  id                :bigint           unsigned, not null, primary key
#  name              :string(255)      not null
#  thumb             :string(255)
#  thumb_tmp         :string(255)
#  keyword           :string(255)
#  category_id       :bigint           not null
#  slug              :string(255)      not null
#  sub_category_id   :bigint           not null
#  short_description :text(65535)
#  started_at        :datetime
#  status            :integer          default("deactive"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Product < ApplicationRecord
  mount_uploader :thumb, ImageUploader
  store_in_background :thumb

  has_many :product_companies
  has_many :companies, through: :product_companies
  belongs_to :category

  enum status: { deactive: 0, active: 1, popular: 2 }

  ransacker :status, formatter: proc { |v| statuses[v] }

  accepts_nested_attributes_for :product_companies

  def thumb_url
    thumb.try(:url)
  end

  def string_to_slug
    companies.pluck(:name).uniq.concat([name]).join(' ')
  end

  def slug_generator
    self.slug = string_to_slug.downcase.tr(VIETNAMESE_CHARACTERS, ENGLISH_CHARACTERS).parameterize.truncate 80, omission: ''
  end
end
