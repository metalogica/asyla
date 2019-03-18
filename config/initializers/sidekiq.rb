Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 5 # replace 5 by your custom value in seconds.
end
