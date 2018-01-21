require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlueCarbuncle
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_controller.asset_host = (ENV["ASSET_HOST"] || nil )
    config.i18n.default_locale = :en
    config.i18n.available_locales = ['en-US', 'en-GB', :en, :de].map(&:to_s)

    # enable CORS (https://github.com/cyu/rack-cors)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000', '127.0.0.1:3000', 'http://d3afqfzdd8lb1l.cloudfront.net/', 'https://d3afqfzdd8lb1l.cloudfront.net'
        resource '*',
          :headers => :any,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client', 'Access-Token', 'Expiry', 'Token-Type', 'Uid', 'Client'],
          :methods => :any,
          :credentials => true
      end
    end

		config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
