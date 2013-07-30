class NotificationWorker
  
  include Sidekiq::Worker
  
  sidekiq_options queue: "notifications"
  sidekiq_options :failures => true
  
  def perform(relationship_id)
    relationship = Relationship.find(relationship_id)
    GiftRecommendationMailer.gift_recommendation(relationship).deliver
    relationship.set_new_due_date(true)
  end
end