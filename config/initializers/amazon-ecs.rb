require 'amazon/ecs'

Amazon::Ecs.options = { :associate_tag => 'bubb-amaz-20', :AWS_access_key_id => ENV['AMAZON_ACCESS_KEY'], :AWS_secret_key => ENV['AMAZON_SECRET_KEY']}

