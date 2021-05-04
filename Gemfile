source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.3.1'
# Use mysql as the database for Active Record
gem 'mysql2', '0.5.3'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# redis to make fast storage
gem 'redis', '~> 3.3', '>= 3.3.1'
gem 'redis-namespace', '~> 1.6.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '1.1.1'

group :development, :test, :staging do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'local_images'
end

group :development, :staging do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.1.1'
  gem 'graphiql-rails', '1.7.0'
  gem 'pry-rails', '0.3.9'
  gem 'annotate', '3.1.1'
  gem 'rubocop', '0.88.0'
  gem 'rubocop-rails', '2.7.1'
  gem 'capistrano', '3.16.0'
  gem 'capistrano3-puma', '5.0.4'
  gem 'capistrano-rails', '1.6.1', require: false
  gem 'capistrano-bundler', '2.0.1', require: false
  gem 'capistrano-rvm', '0.1.2'
  gem 'brakeman'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "rack-attack", '6.5.0'
# Graphql
gem 'graphql', '1.9.4'
gem 'graphql-query-resolver', '0.2.0'
gem 'graphql-batch', '0.4.3'
gem 'graphql-guard', '1.3.1'
gem 'search_object', '1.2.1'
gem 'search_object_graphql', '0.1'
gem 'batch-loader', '1.3.0'
gem 'parallel', '1.17.0'
gem 'ridgepole', '0.9.2'

# Gem upload
gem 'carrierwave', '1.3.1'
gem 'mini_magick',  '4.11.0'
gem 'carrierwave-imageoptimizer', '1.6.0'

# Gem load environment
gem 'dotenv-rails', '2.7.6'

# Gem Pagination
gem 'active_hash', '~> 2.3.0'
gem 'kaminari', '1.1.1'
gem 'rails-observers', '0.1.5'
gem "paranoia", '2.4.3'
gem 'ancestry', '3.2.1'
gem 'ransack', '2.4.2', github: 'activerecord-hackery/ransack'
gem 'slack-notifier', '2.3.2'
gem 'carrierwave_backgrounder', github: 'leoduquesnel/carrierwave_backgrounder'

# ActiveJobAdapter
gem 'sidekiq', '~> 5.0', '>= 5.0.5'
gem 'sidekiq-bulk', '~> 0.1.1'
gem 'sidekiq-scheduler', '~> 2.0', '>= 2.0.8'
gem 'sidekiq-status', '~> 0.6.0'
gem 'fog-google', '1.12.1'
gem 'mailjet', '1.6.0'