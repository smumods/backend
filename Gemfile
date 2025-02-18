source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', require: false
gem 'redis'
gem 'redis-store'

# Backend / APIs etc
gem 'graphql'
gem 'rack-cors'
gem 'friendly_id', '~> 5.2.4' # Note: You MUST use 5.0.0 or greater for Rails 4.0+
gem 'sendgrid-ruby' # for emails
gem 'mailgun-ruby', '~>1.1.6'
gem 'graphql-batch'
gem 'graphql-cache'

# User Auth
gem 'devise'
gem 'bcrypt'
gem 'devise-token_authenticatable'

# Likes / Bookmarks / Subscribes
gem 'action-store'

# Data Generators
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'fuzzy_match' # used for prof data matching

# ActiveAdmin & Addons
gem 'activeadmin'
gem 'activeadmin_addons'
gem 'active_material', github: "vigetlabs/active_material"
gem 'acts_as_list' # needed for activeadmin_sortable_table
gem 'activeadmin_sortable_table'
gem 'arbre'

# Performance
# gem 'appsignal'
gem 'honeybadger', '~> 4.0'
gem 'goldiloader'
gem 'skylight'
gem 'barnes'
gem 'rails_autoscale_agent'

# Analytics
gem 'ahoy_matey'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'graphiql-rails'
  gem 'pry-theme'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet' # for performance monitoring
  gem 'letter_opener'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]