source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# defaults
gem 'rails', '~> 5.2.2'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false

# own gems
gem 'devise'
gem 'jwt'
gem 'simple_form'

# assets
gem 'bootstrap', '~> 4.1.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 3.5'

group :development, :test do
  gem 'pry-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Tests
  gem 'factory_bot_rails', '~> 4.0'
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'simplecov', require: false

  # System tests
  gem 'launchy'
  gem 'capybara'
  gem 'geckodriver-helper'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
