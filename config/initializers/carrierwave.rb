if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAI2WTSOAPR7WAFDCQ'],
      aws_secret_access_key: ENV['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'],
      region: 'us-east-1'
    }
    config.fog_host = "//#{ENV['bubboli']}.s3.amazonaws.com"
    config.fog_directory = ENV['bubboli']
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
    config.storage = :fog
  end
elsif Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
elsif Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

