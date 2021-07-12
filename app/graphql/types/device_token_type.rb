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

module Types
  class DeviceTokenType < BaseNode
    field :token, String, null: true
    field :token_type, String, null: true
    field :user_id, Types::GraphqlIdType, null: true
  end
end
