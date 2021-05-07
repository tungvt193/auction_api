class AuthRepository < BaseRepository
  def sign_in(context, params)
    raise ActiveRecord::RecordNotFound, 'Username is incorrect!' if record.blank?
    raise ::ActionController::InvalidAuthenticityToken, 'Password is incorrect!' unless record.authenticate(params[:password])

    device_token = ::DeviceToken.where(user_id: record.id, token: params[:device_token])
    record.save_device_token(sparams) if device_token.blank?

    expired_at = 1.hour.from_now.strftime('%H:%M %d/%m/%Y')
    token = cryptor.encrypt_and_sign("user-id:#{record.id}&expired-at:#{expired_at}")

    context[:session][:token] = token

    record.assign_attributes({ last_sign_in_at: Time.zone.now })
    record.save!

    token
  end
end
