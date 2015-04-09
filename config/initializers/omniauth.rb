Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, 'c3524fc6251d4d6bad98b1ebe3fe2c50', 'fcd664bd7e8643428e4787b85cba0b0c'
end