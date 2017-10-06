require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OftonRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local # activerecord timezone

    # config.middleware.use Rack::Deflater

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework :rspec,
                       fixture: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false,
                       integration_tool: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
