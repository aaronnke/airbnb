CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: ENV['AWS_REGION']
  }
  config.fog_directory = ENV['S3_BUCKET_NAME']
  config.fog_public = true # set to false if you need protected links
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end