# == Schema Information
#
# Table name: categories
#
#  id         :bigint           unsigned, not null, primary key
#  name       :string(255)      not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Types
  class CategoryType < BaseNode
    field :name, String, null: false
    field :status, String, null: false
    field :thumb_url, String, null: true

    field :product_total, Int, null: true, resolve: Lazy::LazyProductTotal.new
  end
end
