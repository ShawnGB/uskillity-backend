source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# CORS
gem 'rack-cors', :require => 'rack/cors'

# Frontend
gem 'haml'
gem 'haml-rails'
gem 'bootstrap-sass', :git => 'https://github.com/twbs/bootstrap-sass.git', :branch => 'next'
gem 'autoprefixer-rails'
# Carousel
gem 'owlcarousel-rails'

# user management
gem 'devise'
gem 'devise_token_auth'
gem 'stripe'
gem 'rack-oauth2'
gem 'sentry-raven'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-erd'
  gem 'database_cleaner'
  gem 'json_expressions'
  gem 'rubocop'
  gem 'haml_lint'
  gem 'machinist'
  gem 'rails-controller-testing'
  gem 'railroady'
  gem 'factory_girl_rails'
  gem 'simplecov'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# We need for seeding
gem 'faker'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Add translation for HStore fields
gem 'hstore_translate'

# We need to gecode the venues
gem 'geocoder'
gem 'countries'
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'

# add AWS SDK
gem 'aws-sdk', '~> 2'

gem 'postmark-rails', '~> 0.15.0'
gem 'rails-i18n', '~> 5.0.0'

gem 'active_model_serializers', '~> 0.10.0'

# Upload images
gem 'carrierwave'
gem 'fog'
gem 'date_validator'

gem 'koala'
