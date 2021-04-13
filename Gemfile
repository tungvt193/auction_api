source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.3.1'
# Use mysql as the database for Active Record
gem 'mysql2', '0.5.3'
# Use Puma as the app server
gem 'puma', '5.2.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '1.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'graphiql-rails'
  gem 'pry-rails'
  gem 'annotate'
  gem 'rubocop', '0.88.0'
  gem 'rubocop-rails', '2.7.1'
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "rack-attack", '6.5.0'
# Graphql
gem 'graphql', '1.9.4'
gem 'graphql-query-resolver', '0.2.0'
gem 'graphql-batch'
gem 'graphql-guard'
gem 'search_object', '1.2.1'
gem 'search_object_graphql', '0.1'
gem 'batch-loader', '1.3.0'
gem 'parallel', '1.17.0'
gem 'ridgepole'

# Gem upload
gem 'carrierwave', '1.3.1'

# Gem load environment
gem 'dotenv-rails'

# Gem Pagination
gem 'active_hash', '~> 2.3.0'
gem 'cancancan'
gem 'kaminari', '1.1.1'
gem 'rails-observers'
gem "paranoia"
gem 'ancestry'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'graphiql-rails', group: :development
gem 'slack-notifier'