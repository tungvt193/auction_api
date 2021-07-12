# == Schema Information
#
# Table name: banners
#
#  id         :bigint           unsigned, not null, primary key
#  url        :string(255)
#  cover      :string(255)
#  cover_tmp  :string(255)
#  title      :string(255)
#  status     :integer          default("deactive"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Banner < ApplicationRecord
  mount_uploader :cover, ImageUploader
  store_in_background :cover

  enum status: { deactive: 0, active: 1 }

  ransacker :status, formatter: proc { |v| statuses[v] }

  after_commit :init_notification, on: :create
  after_commit :update_notification, on: :update

  def cover_url
    cover.try(:url)
  end

  private

  def init_notification
    return if deactive?

    MakeNotificationJob.perform_async('Banner', status, id)
  end

  def update_notification
    MakeNotificationJob.perform_async('Banner', status, id) if status_previously_changed? && active?
  end
end
