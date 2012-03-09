FOG_CONFIG = YAML.load_file(Rails.root.join('config', 'fog.yml'))[Rails.env]


CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: FOG_CONFIG['access_key_id'],
    aws_secret_access_key: FOG_CONFIG['secret_access_key'],
  }
  
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  elsif Rails.env.development?
    config.storage = :file
  else
    config.storage = :fog
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory = FOG_CONFIG['bucket']
  config.fog_public = false
end
