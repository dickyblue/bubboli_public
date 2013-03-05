Class NotificationWorker
  
  include Sidekiq::Worker
  
  def perform
   sender_reminders_for_today(reminders_for_today) 
  end
  
  def reminders_for_today
    Relationship.where('next_reminder_due_at = ?', Date.today)
  end
  
  def send_reminders_for_today(relationships)
    relationships.each {|r| r.send_reminder}
  end
  
end