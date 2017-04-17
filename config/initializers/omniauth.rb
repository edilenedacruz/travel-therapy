Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
  scope: 'public_profile', info_fields: 'id,name,link,first_name,last_name,picture'
end
