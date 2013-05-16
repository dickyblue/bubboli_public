class AlertsWorker
  
  include Sidekiq::Worker
  
  sidekiq_options queue: "notifications"
  sidekiq_options :failures => true
  
  def perform(alert_type=nil)
    send_friend_alerts if alert_type == 'friend'
    send_gift_alerts if alert_type == 'gift'
  end
  
  def send_friend_alerts
    Relationship.where('friend_alert = ?', true).each do |relationship|
      relationship.send_friend_alert_email
    end
  end
  
  def send_gift_alerts
    GiftAccession.where('gift_alert=?', true).each do |acc|
      acc.send_gift_alert_email
    end
  end
  
end