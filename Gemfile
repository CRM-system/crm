source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
gem 'devise', '4.6.2'
gem 'jquery-rails', '4.3.3'
gem 'semantic-ui-sass', '2.4.0.1'
gem 'semantic-ui-rails', '0.18.0'

gem 'file_validators', '2.3.0'
gem 'mini_magick', '4.9.3'
gem 'translate_enum', '0.1.3'
gem 'pg_search', '2.1.4'
gem 'pry', '0.12.2'
gem 'jquery-ui-rails', '6.0.1'

# gem 'therubyracer'

gem 'jwt', '2.1.0'
gem 'prawn', '2.2.2'
gem 'responders', '2.4.1'
gem 'prawn-table', '0.2.2'
# gem 'paperclip'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg', '1.1.4'
gem 'taps', '0.3.24'

# Use Puma as the app server
gem 'puma', '3.12.1'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.7'

gem 'will_paginate', '3.1.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.20'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', '0.2.4', platforms: :ruby
gem 'bootstrap', '4.1.3'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.8.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '11.0.1', platforms: [:mri, :mingw, :x64_mingw]

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '3.7.0'
  gem 'listen', '3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem "capistrano", "3.11.0", require: false
  gem 'capistrano-rails', '1.4.0', require: false
  gem 'capistrano-rbenv', '2.1.4', require: false
  gem 'capistrano-bundler', '1.5.0', require: false
  gem 'capistrano-rails-db', '0.0.2', require: false
  # gem 'capistrano'
  # gem 'capistrano-passenger'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.16.0'
  gem 'cucumber-rails', '1.6.0', require: false
  gem 'database_cleaner', '1.7.0'
  gem 'selenium-webdriver', '3.141.0'
  gem 'chromedriver-helper', '2.1.1'
  gem 'rspec', '3.8.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '1.2.5', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
