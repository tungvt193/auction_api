class AuthRepository < BaseRepository
  def sign_in(context, params)
    raise ::ActiveRecord::RecordNotFound, 'Tài khoản không chính xác.' if record.blank?
    raise ::ActionController::InvalidAuthenticityToken, 'Mật khẩu không chính xác.' unless record.authenticate(params[:password])

    device_token = ::DeviceToken.where(user_id: record.id, token: params[:device_token])
    record.save_device_token(params[:device_token]) if device_token.blank?

    token = record.generate_token(Settings.login_session_expiration_time_hour.hour)
    context[:session][:token] = token

    record.assign_attributes({ last_sign_in_at: Time.zone.now })
    record.save!

    token
  end

  def verify_otp(context, params)
    response = HTTParty.post(verify_url,
                             headers: {
                               'Content-Type': 'application/json'
                             },
                             body: {
                               sessionInfo: params[:verification_id],
                               code: params[:code]
                             }.to_json)

    raise GraphQL::ExecutionError, 'OTP đã nhập không chính xác.' if response['error'].present?

    user = ::User.by_phone_or_new(response['phoneNumber'])
    token = user.generate_token(Settings.expired_time_otp_minute.minutes)
    context[:session][:token] = token

    token
  end

  private

  def verify_url
    "#{ENV.fetch('FIREBASE_API_URL')}/relyingparty/verifyPhoneNumber?key=#{ENV.fetch('FIREBASE_API_KEY')}"
  end
end
