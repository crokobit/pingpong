require 'rollbar/rails'
Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']

  # Without configuration, Rollbar is enabled by in all environments.
  # To disable in specific environments, set config.enabled=false.
  # Here we'll disable in 'test':
  if Rails.env.test? or Rails.env.development?
    config.enabled = false
  end

end
