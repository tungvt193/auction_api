# == Schema Information
#
# Table name: products
#
#  id                :bigint           unsigned, not null, primary key
#  name              :string(255)      not null
#  thumb             :string(255)
#  thumb_tmp         :string(255)
#  keyword           :text(65535)
#  category_id       :bigint           not null
#  slug              :string(255)      not null
#  sub_category_id   :bigint           not null
#  short_description :text(65535)
#  started_at        :datetime
#  status            :integer          default("deactive"), not null
#  skip_callback     :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Product < ApplicationRecord
  include Searchable

  mount_uploader :thumb, ImageUploader
  store_in_background :thumb

  before_commit :auto_keyword!, on: [:create]
  # after_commit :create_index, on: [:create]
  # after_commit :update_index, on: [:update]
  # after_commit :delete_index, on: [:destroy]

  has_many :product_companies
  has_many :companies, through: :product_companies
  belongs_to :category
  belongs_to :sub_category

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

  class << self
    def elasticsearch_import
      # Delete the previous Products index in Elasticsearch
      Product.__elasticsearch__.create_index! force: true
      Product.__elasticsearch__.refresh_index!

      # Index all Product records from the DB to Elasticsearch
      Product.import force: true
    rescue StandardError
      nil
    end
  end

  def auto_keyword!
    self.keyword = [name, short_description.to_s, category.try(:name).to_s, sub_category.try(:name).to_s].concat(companies.pluck(:name)).join(', ') + category.try(:name).to_s
  end
end
