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
class Follower < ApplicationRecord
end
