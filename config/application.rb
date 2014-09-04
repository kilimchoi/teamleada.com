require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TeamLeada
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Pacific Time (US & Canada)'
    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += %W(#{config.root}/lib)

    # Include extended and custom classes
    config.autoload_paths += %W(#{config.root}/app/custom_classes)

    # We have to manually iterate over all the extended classes to include them in the project.
    Dir[Rails.root.join("app", "extended_classes", "*.rb")].each { |extended_class| require extended_class }

    # Load all sub-folders in the models directly
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]

    # Include fonts
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
