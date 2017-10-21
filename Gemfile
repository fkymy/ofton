source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg'
gem 'puma', '~> 3.7'

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'faker'

end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'guard-rspec'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rubocop'
end

gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
# gem 'font-awesome-rails'
# gem 'react-rails'

gem 'rails-i18n', '~> 5.0.0' # For 5.0.x and 5.1.x
gem 'dotenv-rails'
gem 'kaminari'
gem 'draper'
gem 'gretel'
gem 'google-analytics-rails'
gem 'slack-notifier'
gem 'exception_notification'
gem 'rambulance'
gem 'enumerate_it'
gem 'devise'
gem 'newrelic_rpm'
gem 'jquery-infinite-pages'
gem 'activity_notification'
gem 'rails_autolink'
gem 'meta-tags'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
