# frozen_string_literal: true
CarrierWave.configure do |config|
  config.permissions = 0o666
  config.directory_permissions = 0o777
  config.asset_host = 'http://localhost:3000' if Rails.env.development?

  if Rails.env.production?
    config.fog_provider = 'fog/google'
    config.fog_directory = ENV['GOOGLE_BUCKET_NAME']
    config.fog_credentials = {
      provider: 'Google',
      google_storage_access_key_id: ENV['GOOGLE_ACCESS_KEY'],
      google_storage_secret_access_key: ENV['GOOGLE_ACCESS_SECRET'],
      persistent: false
    }
  end
end
