# == Schema Information
#
# Table name: rates
#
#  id           :bigint           unsigned, not null, primary key
#  ratable_type :string(255)      not null
#  ratable_id   :bigint           not null
#  user_id      :bigint           not null
#  comment      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
module Types
  class RateType < BaseNode
    field :ratable_type, String, null: false
    field :ratable_id, ID, null: false
    field :user_id, ID, null: false
    field :comment, String, null: false

    field :user, Types::UserType, null: true, resolve: Lazy::LazyUser.new
  end
end