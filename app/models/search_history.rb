# == Schema Information
#
# Table name: search_histories
#
#  id          :bigint           unsigned, not null, primary key
#  keyword     :string(255)      not null
#  product_ids :text(65535)
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SearchHistory < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
