class PasswordResetWorker
  
  include Sidekiq::Worker
  
  sidekiq_options queue: "notifications"
  sidekiq_options :failures => true
  
  def perform(id)
    user = User.find_by_id id
    if user
      user.reset_password
    end
  end
  
end