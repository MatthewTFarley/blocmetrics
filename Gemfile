source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.1'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'capybara', '~> 2.4.4'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'simplecov', :require => false
end

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'figaro', '1.0'
gem 'pry-rails'
gem 'faker'
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

