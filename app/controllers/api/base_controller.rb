module Api
  class BaseController < ApplicationController
    before_action :authorized_handler

    attr_accessor :current_user

    def authorized_handler
      @current_user = detect_current_user
    end

    private

    def operation_name
      params[:operationName]
    end

    def detect_current_user
      token, decoded_token = decode_access_token

      items = decoded_token.try(:split, '&').try(:to_a) || []
      user_id = items[0].try(:gsub, 'user-id:', '').to_i
      expired_at = items[1].try(:gsub, 'expired-at:', '')
      token_type = items[2].try(:gsub, 'token-type:', '')

      user = User.find_by(id: user_id)
      return user if skip_operations.include?(operation_name)

      raise ActionController::InvalidAuthenticityToken, 'Phiên đăng nhập không hợp lệ. Vui lòng thử lại!' if token_is_invalid(token, token_type, user)

      return user if token_type == 'crawler'
      raise ActionController::InvalidAuthenticityToken, 'Phiên đăng nhập đã hết hạn. Vui lòng thử lại!' if expired_at.blank? || Time.zone.parse(expired_at) < Time.zone.now

      user
    end

    def decode_access_token
      return if request.headers['Authorization'].blank?

      token = request.headers['Authorization'].split(' ').try(:last)

      [token, cryptor.try(:decrypt_and_verify, token)]
    rescue StandardError
      nil
    end

    def skip_operations
      [
        Api::SkipOperation.admin,
        Api::SkipOperation.common,
        Api::SkipOperation.mobile,
        Api::SkipOperation.web
      ].flatten
    end

    def token_is_invalid(token, token_type, user)
      return true if user.blank?
      return operation_name != 'v1AdminResetPassword' || token != user.reset_password_token if token_type == 'reset_password'
      return token_type == 'new_information' if operation_is_not_reset_password_nor_new_information || token != user.reset_password_token

      false
    end

    def operation_is_not_reset_password_nor_new_information
      operation_name != 'v1CommonNewInformation' && operation_name != 'v1CommonResetPassword'
    end

    def cryptor
      ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    end
  end
end
