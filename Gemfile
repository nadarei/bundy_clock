source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Use MySQL or Sqlite locally in development mode
group :development, :test do
  gem 'mysql2'
  gem 'sqlite3'
  gem 'rspec-rails'
end

# Use postgresql for Heroku.
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'compass'
  gem 'compass-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'haml'
gem 'thin'
gem 'omniauth-google-oauth2', git: 'git://github.com/zquestz/omniauth-google-oauth2.git'
