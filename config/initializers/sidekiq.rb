require 'sidekiq'

require 'autoscaler/sidekiq'
require 'autoscaler/heroku_scaler'

heroku = nil
if ENV['bubboli-kids-staging']
  heroku = {}
  scaleable = %w[default update_price notifications] - (ENV['ALWAYS'] || '').split(' ')
  scaleable.each do |queue|
    heroku[queue] = Autoscaler::HerokuScaler.new(
      queue,
      ENV['8e1c1c4614615661ccb83cce77dc149b50e84be6'],
      ENV['bubboli-kids-staging'])
  end
end

Sidekiq.configure_client do |config|
    config.client_middleware do |chain|
      chain.add Autoscaler::Sidekiq::Client, heroku
    end
end

# define HEROKU_PROCESS in the Procfile:
#
#    default: env HEROKU_PROCESS=default bundle exec sidekiq -r ./background/boot.rb
#    import:  env HEROKU_PROCESS=import bundle exec sidekiq -q import -c 1 -r ./background/boot.rb
# web: bundle exec thin start -p $PORT
# worker: bundle exec sidekiq -e production


Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    if heroku && ENV['HEROKU_PROCESS'] && heroku[ENV['HEROKU_PROCESS']]
      p "Setting up auto-scaledown"
      chain.add(Autoscaler::Sidekiq::Server, heroku[ENV['HEROKU_PROCESS']], 60, [ENV['HEROKU_PROCESS']])
    else
      p "Not scaleable"
    end
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