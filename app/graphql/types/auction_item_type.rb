# == Schema Information
#
# Table name: auction_items
#
#  id                  :bigint           unsigned, not null, primary key
#  name                :string(255)      not null
#  product_name        :string(255)      not null
#  category_name       :string(255)      not null
#  auction_name        :string(255)      not null
#  status              :integer          default(0), not null
#  auction_id          :bigint           not null
#  product_id          :bigint           not null
#  category_id         :bigint           not null
#  price               :float(24)        default(0.0), not null
#  min_price           :float(24)        default(0.0), not null
#  marker              :bigint           not null
#  serial              :string(255)      not null
#  address             :string(255)      not null
#  source_link         :string(255)
#  images              :json
#  user_id             :bigint
#  used_hours          :float(24)        default(0.0), not null
#  year_of_manufacture :datetime         not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
module Types
  class AuctionItemType < BaseNode
    field :name, String, null: false
    field :product_name, String, null: false
    field :category_name, String, null: false
    field :auction_name, String, null: false
    field :status, String, null: false
    field :auction_id, ID, null: false
    field :product_id, ID, null: false
    field :category_id, ID, null: false
    field :sub_category_id, ID, null: true
    field :company_id, ID, null: false
    field :price, String, null: false
    field :min_price, String, null: false
    field :marker, String, null: false
    field :serial, String, null: false
    field :address, String, null: false
    field :source_link, String, null: true
    field :thumb_url, String, null: true
    field :images, [String], null: true, resolve: Lazy::LazyAuctionImage.new
    field :user_id, ID, null: true
    field :used_hours, String, null: false
    field :year_of_manufacture, String, null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
    field :short_description, String, null: true, resolve: Lazy::LazyShortDescription.new

    field :is_followed, Boolean, null: true, resolve: Lazy::LazyIsFollowedAuctionItem.new
    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
    field :auction, Types::AuctionType, null: true, resolve: Lazy::LazyAuction.new
    field :product, Types::ProductType, null: true, resolve: Lazy::LazyProduct.new
    field :category, Types::CategoryType, null: true, resolve: Lazy::LazyCategory.new
    field :sub_category, Types::CategoryType, null: true, resolve: Lazy::LazySubCategory.new
    field :company, Types::CompanyType, null: true, resolve: Lazy::LazyCompany.new
    field :estimated_price, Types::EstimatedPriceType, null: true, resolve: Lazy::LazyEstimatedPrice.new
  end
end
