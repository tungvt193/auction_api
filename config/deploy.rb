set :puma_threads,    [4, 16]
set :puma_workers,    0
set :repo_url,        'git@gitlab.com:its-global/biz/auction-api.git'
set :application,     'auction'
# Defaults to :db role
set :migration_role, :db
# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }

# Defaults to `db:migrate`
set :migration_command, 'db:migrate'

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to [:web]
# set :assets_roles, %i[web app]

# Defaults to ["/path/to/release_path/public/#{fetch(:assets_prefix)}/.sprockets-manifest*", "/path/to/release_path/public/#{fetch(:assets_prefix)}/manifest*.*"]
# This should match config.assets.manifest in your rails config/application.rb
# set :assets_manifests, ['app/assets/config/manifest.js']

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
# set :rails_assets_groups, :assets

# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, %w[public/uploads]

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :rvm_bin_path,    '/usr/local/rvm/scripts/rvm'
set :rvm1_map_bins, %w[rake gem bundle ruby]
set :rvm_ruby_version, '2.6.5'
set :deploy_via, :remote_cache
set :resque_environment_task, true
set :sidekiq_default_hooks, true
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to false when not using ActiveRecord
set :linked_files, %w[.env config/credentials.yml.enc]
set :linked_dirs, fetch(:linked_dirs, []) + %w[log tmp/pids tmp/cache tmp/sockets public]

## Defaults:
# set :scm,           :git
# set :format,        :pretty
# set :log_level,     :debug
set :keep_releases, 2

namespace :deploy do
  task :stop_puma do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: fetch(:stage) do
          execute "ps -ef | grep auction-puma.sock | grep -v grep | awk '{print $2}' | xargs kill -9"
        end
      end
    end
  end

  task :stop_sidekiq do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: fetch(:stage) do
          execute "ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill -9"
        end
      end
    end
  end

  task :start_sidekiq do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: fetch(:stage) do
          execute :bundle, "exec sidekiq --daemon -C config/sidekiq.yml -L log/sidekiq.log -e #{fetch(:stage)} #{fetch(:application)}"
        end
      end
    end
  end

  after :finishing, :stop_puma
  after :finishing, :stop_sidekiq
  after :finishing, :start_sidekiq
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
