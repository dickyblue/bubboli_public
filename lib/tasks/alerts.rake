namespace :alerts do
  desc "Send alerts"
#   task :friend => :environment do
#     AlertsWorker.perform_async('friend')
#   end
#   
#   task :gift => :environment do
#     AlertsWorker.perform_async('gift')
#   end
#   
  task :reminder => :environment do
    Relationship.where('next_reminder_due_at = ?', Date.today).each do |relationship|
      NotificationWorker.perform_async(relationship.id)
    end
  end
#   
#   task :invitation => :environment do
#     InvitationWorker.perform_async
#   end
end