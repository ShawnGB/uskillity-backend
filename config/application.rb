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

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000', 'localhost:3001', '127.0.0.1:3000',
          '127.0.0.1:3000',
          'http://uskillity-reactjs-staging.s3.eu-central-1.amazonaws.com',
          'http://uskillity-reactjs-production.s3.eu-central-1.amazonaws.com',
          'http://d1vpskb3suegzv.cloudfront.net',
          'http://d1f5bgy9ys3olw.cloudfront.net',
          'http://d3afqfzdd8lb1l.cloudfront.net', 'http://uskillity.de', 'http://uskillity.com',
          'https://uskillity-reactjs-staging.s3.eu-central-1.amazonaws.com',
          'https://uskillity-reactjs-production.s3.eu-central-1.amazonaws.com',
          'https://d1vpskb3suegzv.cloudfront.net',
          'https://d1f5bgy9ys3olw.cloudfront.net',
          'https://d3afqfzdd8lb1l.cloudfront.net', 'https://uskillity.de', 'https://uskillity.com',
          'https://www.uskillity.de'
        resource '*',
          :headers => :any,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client', 'Access-Token', 'Expiry', 'Token-Type', 'Uid', 'Client'],
          :methods => :any,
          :credentials => true
      end
    end

    config.fb_secret = (ENV["FACEBOOK_SECRET"] || '9bdd43d78fe14574a24d2b9ee9c86444')
    config.fb_app_id = (ENV["FACEBOOK_APP_ID"] || '624849507671905')

    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    Raven.configure do |config|
      config.dsn = (ENV["SENTRY_DSN"] || 'https://0e56b446eb7944faaa5b414f172c58a4:30499855d7344b2a9f20c7a2c14976c0@sentry.io/1215685')
      config.current_environment = (ENV["SENTRY_ENV"] || "develop")
    end

  end
end
