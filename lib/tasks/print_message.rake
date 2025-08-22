# lib/tasks/print_message.rake
namespace :my_namespace do
  desc "Print a test message (used by cron)"
  task print_message: :environment do
    message = "Cron Rake: Hello! Time: #{Time.current}"
    puts message                 # goes to STDOUT (captured by cron)
    Rails.logger.info message    # also writes to Rails logs
  end
end
