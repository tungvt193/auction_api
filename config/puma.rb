#!/usr/bin/env puma

environment ENV['RAILS_ENV']

return unless %w[production staging].include?(ENV['RAILS_ENV'])

directory '/home/root/apps/auction/current'
rackup '/home/root/apps/auction/current/config.ru'

tag ''

pidfile '/home/root/apps/auction/shared/tmp/pids/puma.pid'
state_path '/home/root/apps/auction/shared/tmp/pids/puma.state'
stdout_redirect '/home/root/apps/auction/shared/log/puma_access.log', '/home/root/apps/auction/shared/log/puma_error.log', true

threads 4, 16

bind 'unix:///home/root/apps/auction/shared/tmp/sockets/auction-puma.sock'

workers 0

preload_app!

on_restart do
  Rails.logger.info('Refreshing Gemfile')

  ENV['BUNDLE_GEMFILE'] = ''
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
