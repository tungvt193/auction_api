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
class Notification < ApplicationRecord
  enum notification_type: {
    owner: 0, # Notification dành cho 1 cá nhân
    global: 1 # Notification Global toàn hệ thống
  }

  enum status: {
    unread: false, # Chưa Đọc
    readed: true   # Đã Đọc
  }

  belongs_to :user, optional: true

  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :notification_type, formatter: proc { |v| notification_types[v] }
end
