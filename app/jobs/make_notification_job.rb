class MakeNotificationJob < ApplicationJob
  sidekiq_options queue: :make_notification_job, retry: 0

  def perform(class_name, type, id)
    record = class_name.constantize.find_by id: id

    return if record.blank?

    body_notifications = ::NotificationRepository.new(nil, record).make_body(type)
    return if body_notifications.blank?

    if body_notifications.is_a?(Array)
      body_notifications.each do |e_body|
        Notification.create!(e_body)
      end

      return
    end

    Notification.create!(body_notifications)
  end
end
