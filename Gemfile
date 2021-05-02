source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# defaults
gem 'rails', '~> 5.2.2'
gem 'sqlite3'
gem 'puma', '~> 3.12'
gem 'bootsnap', '>= 1.1.0', require: false

# own gems
gem 'devise'
gem 'simple_form'

# assets
gem 'bootstrap', '~> 4.3.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.3.0'

group :development, :test do
  gem 'pry-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
