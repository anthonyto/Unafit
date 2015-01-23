ruby '2.1.5'
source 'https://rubygems.org'

gem 'rails', '4.1.8'
gem 'mysql2'

# Front end stuff
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# Not sure if I want to use this yet. Seems complicated and unnecessary
gem 'jquery-datatables-rails', '~> 3.1.1'
gem 'jquery-ui-rails'
gem 'twitter-bootstrap-rails'
gem 'jquery-rails'
gem 'underscore-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks# bundle exec rake doc:rails generates the API under doc/api.

# For authentication and authorization
gem 'devise'
gem 'devise_invitable', '~> 1.3.4'
gem 'pundit'

# For environment variable configurations
gem 'figaro'

# for payments
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# for cron jobs
gem 'whenever', :require => false

# Google maps integration
gem 'gmaps4rails', '~> 2.1.2'
gem 'geocoder'

# Image Uploading
gem "paperclip", "~> 4.2"
gem 'aws-sdk'

group :development, :test do 
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'foreman'
end

group :production do
  gem 'rails_12factor'
end