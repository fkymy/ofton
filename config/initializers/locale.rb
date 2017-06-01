# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

# Whitelist locale available for the application
I18n.available_lacales = [:en, :ja]

# Set default locale
I18n.default_locale = :ja

