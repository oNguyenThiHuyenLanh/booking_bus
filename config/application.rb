require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.load_path += Dir[Rails.root.join("config",
      "locales", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :vi

    # i18n for js
    config.middleware.use I18n::JS::Middleware
    config.sass.load_paths << File.expand_path('../../vendor/assets/stylesheets/')
  end
end
