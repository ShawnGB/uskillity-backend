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


		config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
