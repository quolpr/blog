source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',  group: :doc
gem 'bower-rails'

gem 'slim'
gem 'angular-rails-templates'
gem 'draper'

gem "autoprefixer-rails"

gem "rails_config"
group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'therubyracer'
  gem 'shoulda-matchers'
  gem 'poltergeist'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'coveralls', require: false
  gem 'quiet_assets'
  gem 'spring'
end

group :production do
  gem 'unicorn'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'foreman'
end
