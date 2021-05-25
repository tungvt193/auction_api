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
#  short_description :text(65535)
#  started_at        :datetime
#  status            :integer          default("deactive"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
module Types
  class ProductType < BaseNode
    field :name, String, null: false
    field :thumb_url, String, null: true
    field :keyword, String, null: false
    field :category_id, ID, null: false
    field :started_at, String, null: false
    field :status, String, null: false
    field :short_description, String, null: true

    field :company, Types::CompanyType, null: true, resolve: Lazy::LazyCompany.new
    field :category, Types::CategoryType, null: true, resolve: Lazy::LazyCategory.new
    field :sub_category, Types::SubCategoryType, null: true, resolve: Lazy::LazySubCategory.new
  end
end
