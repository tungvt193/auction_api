server 'auction-staging', roles: %i[web app db], primary: true
set :ssh_options, forward_agent: true, user: 'root'
# If the environment differs from the stage name
set :rails_env, 'staging'

# Change these
set :branch, 'staging'
set :user, 'root'
set :rvm_type,        :system
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
# Schedule cron tab
# set :whenever_roles, -> { :cron }
# set :whenever_command, "cd /home/#{fetch(:user)}/apps/#{fetch(:application)}/current && crontab -r && RAILS_ENV=staging bundle exec whenever --update-crontab"
set :sidekiq_pid, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/shared/tmp/pids/sidekiq.pid"
set :sidekiq_log, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/shared/log/sidekiq.log"
