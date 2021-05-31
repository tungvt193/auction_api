# == Schema Information
#
# Table name: followers
#
#  id              :bigint           unsigned, not null, primary key
#  followable_type :string(255)      not null
#  followable_id   :bigint           not null
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
module Types
  class FollowerType < BaseNode
    field :followable_type, String, null: false
    field :followable_id, ID, null: false
    field :user_id, ID, null: false

    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
  end
end
