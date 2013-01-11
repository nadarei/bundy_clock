source 'https://rubygems.org'

gem 'rails', '3.1.10'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Use MySQL or Sqlite locally in development mode
group :development, :test do
  gem 'mysql2'
  gem 'sqlite3'

  # RSpec - Testing using describe/it/should.
  # http://rubygems.org/gems/rspec
  gem 'rspec-rails'
end

group :test do
  # Capybara - Integration testing by simulating browsers
  # http://rubygems.org/gems/capybara
  gem 'capybara'

  # Machinist - Factories to easily make models.
  # https://github.com/notahat/machinist
  # gem 'machinist'
  
  # Mocha - Stubbing and Mocking.
  # http://rubygems.org/gems/mocha
  # gem 'mocha'
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
gem 'heroku'
