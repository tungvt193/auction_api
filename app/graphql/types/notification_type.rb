# == Schema Information
#
# Table name: notifications
#
#  id                :bigint           unsigned, not null, primary key
#  title             :string(255)      not null
#  notification_type :integer          default("owner"), not null
#  message           :text(65535)
#  status            :boolean          default("unread"), not null
#  image_url         :string(255)
#  data              :json
#  user_id           :bigint
#  reader_ids        :text(65535)
#  blinder_ids       :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
module Types
  class NotificationType < BaseNode
    field :title, String, null: true
    field :notification_type, String, null: true
    field :message, String, null: true
    field :status, String, null: true
    field :image_url, String, null: true
    field :data, String, null: true
  end
end
