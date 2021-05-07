# == Schema Information
#
# Table name: device_tokens
#
#  id         :bigint           unsigned, not null, primary key
#  token      :text(65535)
#  token_type :integer          default("anonymous"), not null
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DeviceToken < ApplicationRecord
  belongs_to :user, optional: true

  enum token_type: { anonymous: 0, owner: 1 }

  ransacker :token_type, formatter: proc { |v| token_types[v] }
end
