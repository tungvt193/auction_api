# == Schema Information
#
# Table name: rates
#
#  id           :bigint           unsigned, not null, primary key
#  ratable_type :string(255)      not null
#  ratable_id   :bigint           not null
#  user_id      :bigint           not null
#  comment      :text(65535)
#  star         :float(24)        default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
module Types
  class RateType < BaseNode
    field :star, Float, null: false
    field :ratable_type, String, null: false
    field :ratable_id, ID, null: false
    field :user_id, ID, null: false
    field :comment, String, null: false
    field :username, String, null: true, resolve: LazyRatingName.new

    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
  end
end
