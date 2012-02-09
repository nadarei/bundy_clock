Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['GOOGLE_CLIENT_ID'],
    ENV['GOOGLE_SECRET'],
    {access_type: 'online', approval_prompt: ''}
end
