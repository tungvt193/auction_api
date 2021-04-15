# == Schema Information
#
# Table name: favorites
#
#  id               :bigint           unsigned, not null, primary key
#  favoritable_type :string(255)      not null
#  favoritable_id   :bigint           not null
#  user_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
module Types
  class FavoriteType < BaseNode
    field :favoritable_type, String, null: false
    field :favoritable_id, ID, null: false
    field :user_id, ID, null: false
  end
end
