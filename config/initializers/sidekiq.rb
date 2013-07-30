require 'sidekiq'

require 'autoscaler/sidekiq'
require 'autoscaler/heroku_scaler'

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Autoscaler::Sidekiq::Client, 'default, notifications, price_update' => Autoscaler::HerokuScaler.new
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add(Autoscaler::Sidekiq::Server, Autoscaler::HerokuScaler.new, 60)
  end
end

require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == 'abc@test.com' && password == 'password'
end 



# require 'autoscaler/sidekiq'
# require 'autoscaler/heroku_scaler'
# 
# heroku = nil
# if ENV['HEROKU_APP']
#   heroku = Autoscaler::HerokuScaler.new
# end
# 
# Sidekiq.configure_client do |config|
#   if heroku
#     config.client_middleware do |chain|
#       chain.add Autoscaler::Sidekiq::Client, 'default' => heroku
#     end
#   end
# end
# 
# Sidekiq.configure_server do |config|
#   config.server_middleware do |chain|
#     if heroku
#       p "[Sidekiq] Running on Heroku, autoscaler is used"
#       chain.add(Autoscaler::Sidekiq::Server, heroku, 60) # 60 seconds timeout
#     else
#       p "[Sidekiq] Running locally, so autoscaler isn't used"
#     end
#   end
# end

# 
# Sidekiq.configure_client do |config|
#   config.redis = { :size => 1 }
# end