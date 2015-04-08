# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( edit_subscriptions.js )

Rails.application.config.assets.precompile += %w( homepage-files.css )
Rails.application.config.assets.precompile += %w( homepage-files.js )
Rails.application.config.assets.precompile += %w( gyms-files.css )
Rails.application.config.assets.precompile += %w( gyms-files.js )
Rails.application.config.assets.precompile += %w( dashboards/dashboard-files.css )
Rails.application.config.assets.precompile += %w( dashboards/dashboard-files.js )
Rails.application.config.assets.precompile += %w( map.js )