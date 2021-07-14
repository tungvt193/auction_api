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
    global: 1, # Notification Global toàn hệ thống
    admin: 2
  }

  enum status: {
    unread: false, # Chưa Đọc
    readed: true   # Đã Đọc
  }

  belongs_to :user, optional: true

  after_commit :push_notification, on: :create

  ransacker :status, formatter: proc { |v| statuses[v] }
  ransacker :notification_type, formatter: proc { |v| notification_types[v] }

  scope :available_notification, lambda { |owner|
    base_query(
      owner, {
        notification_type_eq: 'global'
      }
    )
  }

  scope :admin_notification, lambda { |owner|
    base_query(
      owner, {
        notification_type_in: %w[global admin]
      }
    )
  }

  class << self
    def base_query(owner, or_query)
      graphql_ransack(
        {
          m: 'or',
          g: {
            '0' => {
              user_id_eq: owner.try(:id)
            },
            '1' => or_query
          }
        }
      ).
        where(
          '(blinder_ids NOT LIKE ?) IS NOT TRUE ',
          "%#{owner.try(:id)} ,"
        )
    end
  end

  def is_readed?(reader)
    return false if reader.blank?
    return try(:readed?) if try(:owner?)

    try(:reader_ids).to_s.try(:include?, reader.try(:string_id))
  end

  def read_by!(reader)
    self.reader_ids = reader_ids.to_s.split(', ').concat([reader.try(:id)]).compact.uniq.join(', ')
    save!
  end

  def remove_by!(blinder)
    destroy! if try(:owner?)

    self.blinder_ids = blinder_ids.to_s.split(', ').concat([blinder.try(:id)]).compact.uniq.join(', ')
    save!
  end

  private

  def push_notification
    ::PusherRepository.new(self).execute!
  end
end
