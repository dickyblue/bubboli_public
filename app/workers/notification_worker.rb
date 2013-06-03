class NotificationWorker
  
  include Sidekiq::Worker
  
  sidekiq_options queue: "notifications"
  sidekiq_options :failures => true
  
  def perform(relationship_id)
    relationship = Relationship.find(relationship_id)
    GiftRecommendationMailer.gift_recommendation(relationship).deliver
    relationship.set_new_due_date(true)
  end
#   
#   def reminders_for_today
#     Relationship.where('next_reminder_due_at = ?', Date.today)
#   end
#   
#   def send_reminders_for_today(relationships)
#     relationships.each {|r| r.send_reminder}
#   end
#   
end