class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #devise :database_authenticatable, :registerable,
  #    :recoverable, :rememberable, :trackable, :validatable,
  #  :omniauthable, :omniauth_providers => [:fitbit]

  def self.from_omniauth(auth)
		#hash = auth
		#render hash
  #   auth = request.env['omniauth.auth']

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.provider = auth.provider
      user.uid = auth.uid
        #user.email = auth.info.email
        #user.email = auth.email
        #user.password = Devise.friendly_token[0,20]
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
        #render :text => hash
        #user.save
      end
        #session[:user_id] = user.id
  end
end
