 CarrierWave.configure do |config|
  if Rails.env.test?# || Rails.env.development?
    config.storage = :file
  else
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.storage = :fog
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :region => ENV['AWS_REGION'],
      :persistent => false # This is required to prevent write timeouts from PUT requests to S3
    }
    config.fog_directory = ENV['AWS_BUCKET']
    # config.fog_public = false
    p config.fog_directory
    p config.fog_credentials
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
