require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleGraphqlProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Regex should match all subdomains and domain for *.smumods.com/*/* 
    # as well as localhost or 127.0.0.1 and all ports
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins /\A.*[(localhost)?(127.0.0.1)?]:.*\z/
        resource '*', :headers => :any, :methods => [:get, :post]
      end
      allow do
        origins /\A.*(smumods.com){1}.*\z/
        resource '*', :headers => :any, :methods => [:get, :post]
      end
    end
      
    # Set timezone
    config.time_zone = 'Singapore'
    # config.active_record.default_timezone = :local
    # config.active_record.time_zone_aware_attributes = false
    # config.active_record.time_zone_aware_types = [:datetime, :time]

    # Skylight Instrumentation
    config.skylight.probes += %w(redis graphql)
  end
end
