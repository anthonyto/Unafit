ruby '2.1.5'
source 'https://rubygems.org'

gem 'rails', '4.1.8'
gem 'mysql2'

# Front end stuff
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

# Assets
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '3.1.1'
  gem 'rails-assets-jquery', '2.1.0'
  gem 'rails-assets-jquery.ui'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-underscore'
  gem 'rails-assets-fontawesome'
  gem 'rails-assets-waypoints', '2.0.4'
end

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
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'foreman'
end

group :production do
  gem 'rails_12factor'
end