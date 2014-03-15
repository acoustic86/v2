Showping::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  
  config.action_mailer.default_url_options = { :host => 'localhost:8080' }
  # Custom Mailer Settings
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default :charset => "utf-8"
  
  #APP_CONFIG = YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]
  
  config.action_mailer.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => 'virthium.com',
  :user_name => Figaro.env.v_email,
  :password => Figaro.env.v_email_password,
  :authentication => 'login',
  :enable_starttls_auto => true }

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true #changed for faster page loading in development.... change back before deploying
  
  Paperclip.options[:command_path] = "C:\ImageMagic"
  Paperclip.options[:swallow_stderr] = false
  # if doesn't work try:
  #Paperclip.options[:command_path] = "C:/ImageM~1"
  
  #Amazon S3 settings for Paperclip uploads
  #config.paperclip_defaults = {
  #:storage => :s3,
  #:s3_credentials => {
    #:bucket => ENV['AWS_BUCKET'],
    #:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    #:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  #}
#}
end
