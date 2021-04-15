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
class Favorite < ApplicationRecord
end
