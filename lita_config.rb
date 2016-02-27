Lita.configure do |config|
  # Require any of our own extensions that are not in gem format
  Dir.glob(File.join(File.dirname(__FILE__), 'lib', '**.rb')).each { |file| require file }

  # The name your robot will use.
  config.robot.name = 'dorkbot'
  config.robot.alias = 'dork'

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = ENV['LITA_LOG_LEVEL'] || :info

  # Redis Brain
  config.redis = { host: 'brain', port: 6379 }

  # Adapter setup
  config.robot.adapter        = ENV['LITA_ADAPTER'] || :slack
  config.adapters.slack.token = ENV['LITA_SLACK_TOKEN'] || ''
  config.robot.admins         = ENV['LITA_ROBOT_ADMINS'].split(',')

  # Giphy Animation
  config.handlers.giphy.api_key = ENV['LITA_GIPHY_API_KEY'] || ''

  # Google Images Search
  config.handlers.google_images.google_cse_id = ENV['LITA_GOOGLE_CSE_ID'] || ''
  config.handlers.google_images.google_cse_key = ENV['LITA_GOOGLE_CSE_KEY'] || ''
  config.handlers.google_images.safe_search = :off
end
