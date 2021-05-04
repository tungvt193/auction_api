server 'auction-production', roles: %i[web app db], primary: true
set :ssh_options, forward_agent: true, user: 'auction'
# If the environment differs from the stage name
set :rails_env, 'production'

# Change these
set :branch, 'master'
set :user, 'auction'
set :rvm_type, :user
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
# Schedule cron tab
# set :whenever_roles, -> { :cron }
# set :whenever_command, "cd /home/#{fetch(:user)}/apps/#{fetch(:application)}/current && crontab -r && RAILS_ENV=production bundle exec whenever --update-crontab"
set :sidekiq_pid, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/shared/tmp/pids/sidekiq.pid"
set :sidekiq_log, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/shared/log/sidekiq.log"
