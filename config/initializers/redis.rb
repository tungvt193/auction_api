# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/scheduler'
require 'sidekiq-status'

Redis::Namespace.new('auction_api', redis: Redis.new)

redis_config = Rails.application.config_for(:redis)
# YAML.load(ERB.new(File.read(Rails.root.join("config", "redis.yml"))).result).symbolize_keys[Rails.env.to_sym]

Redis.current = Redis.new(redis_config)

Sidekiq.configure_server do |config|
  config.redis = redis_config
  config.server_middleware do |chain|
    # accepts :expiration (optional)
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  end
  config.client_middleware do |chain|
    # accepts :expiration (optional)
    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes # default
  end
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
  config.client_middleware do |chain|
    # accepts :expiration (optional)
    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes # default
  end
end
