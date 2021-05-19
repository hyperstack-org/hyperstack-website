source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#  Hyperloop gems
# gem 'hyperloop', ">=0.9.1", "<1.0.0"
gem 'jquery-rails'
gem 'opal-rails'

gem 'hyper-component', github: 'hyperstack-org/hyperstack', branch: 'edge', glob: 'ruby/*/*.gemspec' # path: '../hyperstack/ruby/hyper-component' #
gem 'hyper-state', github: 'hyperstack-org/hyperstack', branch: 'edge', glob: 'ruby/*/*.gemspec' # path: '../hyperstack/ruby/hyper-state' #
gem 'hyper-store', github: 'hyperstack-org/hyperstack', branch: 'edge', glob: 'ruby/*/*.gemspec' # path: '../hyperstack/ruby/hyper-store' #
gem 'hyper-router', github: 'hyperstack-org/hyperstack', branch: 'edge', glob: 'ruby/*/*.gemspec'
gem 'hyperstack-config', github: 'hyperstack-org/hyperstack', branch: 'edge', glob: 'ruby/*/*.gemspec'
# gem "hyperstack-config", path: "../hyperstack/ruby/hyperstack-config"

# Local gems
# gem 'hyper-component', path: '../hyperstack', glob: 'ruby/*/*.gemspec'
# gem 'hyper-state', path: '../hyperstack', glob: 'ruby/*/*.gemspec'
# gem 'hyper-store', path: '../hyperstack', glob: 'ruby/*/*.gemspec'
# gem 'hyper-router', path: '../hyperstack', glob: 'ruby/*/*.gemspec'
# gem 'hyperstack-config', path: '../hyperstack', glob: 'ruby/*/*.gemspec'

# gem 'opal_hot_reloader', github: 'hyperstack-org/opal-hot-reloader', branch: 'hyperstack'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.3.1', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'foreman'
  gem 'rubocop'
  gem 'hyper-trace', github: 'hyperstack-org/hyperstack', branch: 'edge', glob: 'ruby/*/*.gemspec'
  gem 'pry'
end

group :test do
  # Coveralls coverage
  gem 'coveralls', require: false
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
