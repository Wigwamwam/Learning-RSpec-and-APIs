source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'jbuilder', '~> 2.7'

gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false

gem 'rubocop', '~> 1.35', require: false


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.0'
gem 'rspec','~> 3.4'

gem "rspec-rails", group: [:development, :test]

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

group :development, :test do
  gem "factory_bot_rails"
end

gem 'solargraph', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'


gem 'active_model_serializers'

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
