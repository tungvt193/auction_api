class PusherRepository < BaseRepository
  def initialize(record)
    super(nil, record)
  end

  def execute!
    device_tokens = avaiable_device_tokens
    return if device_tokens.blank?

    options = base_message({
                             title: record.try(:title).to_s,
                             message: record.try(:message).to_s,
                             data: record.try(:data)
                           })

    response = fcm.send(device_tokens, options)

    return if response[:status_code] != 200

    unregistration_ids = response[:not_registered_ids]

    DeviceToken.where(token: unregistration_ids).delete_all
  end

  private

  attr_accessor :record

  def fcm
    FCM.new(ENV['FIREBASE_SERVER_KEY'])
  end

  def base_message(body)
    {
      notification: {
        title: body[:title],
        body: body[:message],
        icon: ENV['NOTIFICATION_ICON']
      },
      content_available: true,
      data: JSON.parse(body[:data])
    }
  end

  def avaiable_device_tokens
    return ::DeviceToken.pluck(:token) if record&.global?

    record.try(:user).try(:device_tokens)&.pluck(:token)
  end
end
