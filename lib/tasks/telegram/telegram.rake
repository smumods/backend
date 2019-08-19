namespace :telegram do
  desc 'Run development bot poller'
  task dev: :environment do
    ENV['BOT_POLLER_MODE'] = 'true'
    bot_id = ENV.fetch('BOT') { Rails.env }.to_sym
    if ENV.fetch('LOG_TO_STDOUT') { Rails.env.development? }.present?
      console = ActiveSupport::Logger.new(STDERR)
      Rails.logger.extend ActiveSupport::Logger.broadcast console
    end
    puts "Starting bot poller for [#{bot_id}]..."
    begin
      if Telegram.bots[bot_id].nil?
        puts "[#{Rails.env}] does not have a bot. Reverting to :default"
        bot_id = "default".to_sym
      end
      Telegram::Bot::UpdatesPoller.start(Telegram.bots[bot_id], TelegramController)
    rescue Telegram::Bot::NotFound
      puts "Unable to find bot [#{bot_id}]. Aborting..."
    end
  end
end
