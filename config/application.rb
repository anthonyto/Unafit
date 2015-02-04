require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Unafit
  class Application < Rails::Application    

    config.exceptions_app = self.routes
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile += %w( *.svg *.eot *.woff *.ttf )
  end
end
