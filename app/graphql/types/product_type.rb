# == Schema Information
#
# Table name: products
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  thumb      :string(255)
#  thumb_tmp  :string(255)
#  code       :string(255)      not null
#  price      :float(24)        default(0.0), not null
#  keyword    :string(255)
#  company_id :bigint           not null
#  category_id :bigint           not null
#  star       :float(24)        default(0.0), not null
#  star_total :float(24)        default(0.0), not null
#  started_at :datetime
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Types
  class ProductType < BaseNode
    field :name, String, null: false
    field :thumb_url, String, null: false
    field :keyword, String, null: false
    field :category_id, ID, null: false
    field :star, String, null: false
    field :star_total, String, null: false
    field :started_at, String, null: false
    field :status, String, null: false
    field :short_description, String, null: true

    field :company, Types::CompanyType, null: true, resolve: Lazy::LazyCompany.new
    field :category, Types::CategoryType, null: true, resolve: Lazy::LazyCategory.new
  end
end
