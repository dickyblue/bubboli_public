namespace :alerts do
  desc "Send alerts"
  task :friend => :environment do
    AlertsWorker.perform_async('friend')
  end
  
  task :gift => :environment do
    AlertsWorker.perform_async('gift')
  end
  
  task :reminder => :environment do
    NotificationWorker.perform_async
  end
end