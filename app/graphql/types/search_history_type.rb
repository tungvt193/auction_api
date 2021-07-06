# == Schema Information
#
# Table name: search_histories
#
#  id         :bigint           unsigned, not null, primary key
#  keyword    :string(255)      not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Types
  class SearchHistoryType < BaseNode
    field :keyword, String, null: false
    field :product_id, Types::GraphqlIdType, null: true
    field :user_id, Types::GraphqlIdType, null: false

    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
    field :product, Types::ProductType, null: true, resolve: Lazy::LazyProduct.new
  end
end
