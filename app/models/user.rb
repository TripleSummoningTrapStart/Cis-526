class User < ActiveRecord::Base

  #omniauths creation checker
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.provider = auth.provider
      user.uid = auth.uid
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end
  end
end
