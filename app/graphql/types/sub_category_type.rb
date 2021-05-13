# == Schema Information
#
# Table name: sub_categories
#
#  id          :bigint           unsigned, not null, primary key
#  name        :string(255)      not null
#  category_id :bigint           not null
#  status      :integer          default(0), not null
#  position    :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
module Types
  class SubCategoryType < BaseNode
    field :name, String, null: false
    field :status, String, null: false
    field :position, Int, null: true
    field :category_id, ID, null: false

    field :category, Types::CategoryType, null: true, resolve: Lazy::LazyCategory.new
  end
end
