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
#  model             :string(255)
#  product_type      :integer          default("size_20_feet"), not null
#  score             :float(24)        default(0.0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Product < ApplicationRecord
  include Searchable

  mount_uploader :thumb, ImageUploader
  store_in_background :thumb

  before_commit :auto_keyword!, on: [:create]
  after_commit :create_index, on: [:create]
  after_commit :update_index, on: [:update]
  after_commit :delete_index, on: [:destroy]

  has_many :product_companies
  has_many :companies, through: :product_companies
  belongs_to :category
  belongs_to :sub_category

  enum status: { deactive: 0, active: 1, popular: 2 }
  enum product_type: { size_20_feet: 0, size_10_ton: 1, size_20_ton: 2, size_30_ton: 3 }

  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :product_type, formatter: proc { |v| product_types[v] }

  accepts_nested_attributes_for :product_companies

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

  def thumb_url
    thumb.try(:url)
  end

  def string_to_slug
    companies.pluck(:name).uniq.concat([name]).join(' ')
  end

  def slug_generator
    self.slug = string_to_slug.downcase.tr(VIETNAMESE_CHARACTERS, ENGLISH_CHARACTERS).parameterize.truncate 80, omission: ''
  end

  def auto_keyword!
    self.keyword = [name, short_description.to_s, category.try(:name).to_s, sub_category.try(:name).to_s].concat(companies.pluck(:name)).join(', ') + category.try(:name).to_s
  end

  def vn_transport_fee
    Estimated.vn_transport_fee[product_type.to_sym]
  end

  def vn_regsitry_fee
    Estimated.registry_fee[product_type.to_sym]
  end

  def clearance_fee
    Estimated.clearance_fee[product_type.to_sym]
  end

  def append_keyword(word)
    self.keyword = "#{keyword} #{word}" unless keyword.include?(word)
    self.save!
  end
end
