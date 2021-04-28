module Api
  class BaseController < ApplicationController
    before_action :authorized_handler

    attr_accessor :current_user

    def authorized_handler
      return if skip_operations.include?(operation_name)

      @current_user = detect_current_user
    end

    private

    def operation_name
      params[:operationName]
    end

    def detect_current_user
      token = decode_access_token

      raise ActionController::InvalidAuthenticityToken, 'Invalid Token. Please login and try again!' if token.blank?

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
      token = crypt.decrypt_and_verify token
      items = token.split('&')

      raise ActionController::InvalidAuthenticityToken, 'Invalid Token. Please login and try again!' if items&.first.blank?

      user_id = items[0].gsub('user-id:', '').to_i
      expired_at = items[1]&.gsub('expired-at:', '')
      token_type = items[2]&.gsub('token-type:', '')

      user = User.find_by(id: user_id)

      raise ActionController::InvalidAuthenticityToken, 'Token was expired. Please login again!' if user.blank?
      return user if token_type == 'crawler'

      raise ActionController::InvalidAuthenticityToken, 'Token was expired. Please login again!' if expired_at.blank? || Time.zone.parse(expired_at) < Time.zone.now

      user
    end

    def decode_access_token
      return if request.headers['Authorization'].blank?

      request.headers['Authorization'].split(' ').try(:last)
    end

    def skip_operations
      %w[
        v1SignIn
        v1ForgotPassword
        v1ResetPassword
        v1NewsList
        v1CategoryList
        v1CompanyList
        v1ProductList
        v1AuctionList
        v1Product
        v1Category
        v1Company
        v1News
        v1Auction
        v1BannerList
        v1NearestAuctionList
        v1AuctionItemList
        v1AuctionItem
        v1AuctionItemNearestList
      ]
    end
  end
end
