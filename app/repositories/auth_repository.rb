class AuthRepository < BaseRepository
  def sign_in(context, params)
    raise ::ActiveRecord::RecordNotFound, 'Tài khoản không chính xác.' if record.blank?
    raise ::ActionController::InvalidAuthenticityToken, 'Mật khẩu không chính xác.' unless record.authenticate(params[:password])

    device_token = ::DeviceToken.where(user_id: record.id, token: params[:device_token])
    record.save_device_token(params[:device_token]) if device_token.blank?

    token = record.generate_token(Settings.token_time.normal.week)
    context[:session][:token] = token

    record.assign_attributes({ last_sign_in_at: Time.zone.now })
    record.save!

    token
  end

  def verify_otp(params)
    response = HTTParty.post(verify_url,
                             headers: {
                               'Content-Type': 'application/json'
                             },
                             body: {
                               sessionInfo: params[:verification_id],
                               code: params[:code]
                             }.to_json)

    raise GraphQL::ExecutionError, 'OTP đã nhập không chính xác.' if response['error'].present?

    @user = ::User.by_phone_or_new(response['phoneNumber'])
    token_type = 'new_information' if user.deactive?
    token = user.generate_token(time_expired, token_type)

    user.update!({ reset_password_token: token })
    [user, token]
  end

  private

  def verify_url
    "#{ENV.fetch('FIREBASE_API_URL')}/relyingparty/verifyPhoneNumber?key=#{ENV.fetch('FIREBASE_API_KEY')}"
  end

  def time_expired
    return Settings.token_time.reset_password.minutes if user.deactive?

    Settings.token_time.normal.week
  end
end
