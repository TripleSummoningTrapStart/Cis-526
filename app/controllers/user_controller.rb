class UserController < ApplicationController
def show
  @client = createClient()
  getActivites()
end

def create
  auth = request.env['omniauth.auth']

  user = User.find_or_create_by(uid: auth.uid) do |user|
  #user.provider = auth.provider
  user.uid = auth.uid
  #user.email = auth.info.email
  #user.email = auth.email
  #user.password = Devise.friendly_token[0,20]
  user.token = auth.credentials.token
  user.secret = auth.credentials.secret
  end
  #render :text => hash
  #user.save
  session[:user_id] = user.id
  flash[:notice] = 'Signed In'
end

def destroy
  session[:user_id] = nil
  flash[:notice] = 'Signed Out'
end

  def index
    @users = User.all
  end

  #def show
    #@user = User.find(params[:id])
   # unless @user == current_user
    #  redirect_to :back, :alert => "Access denied."
    #end
 # end

def createClient
  @current_user = User.find(session[:user_id])

  @client = Fitgem::Client.new(
      :consumer_key => 'c3524fc6251d4d6bad98b1ebe3fe2c50',
      :consumer_secret => 'fcd664bd7e8643428e4787b85cba0b0c',
      :token => @current_user.token,
      :secret => @current_user.secret,
      :user_id => @current_user.uid,
      :ssl => true
  )

end

def getActivites
  activity = @client.activities_on_date('today')
  fuckrails = @client.user_info
  #render :text => activity
  @goals = @client.goals
  #render :text => activity['summary']['caloriesOut']
 # render :text => hello['goals']['caloriesOut']
  #render :text => fuckrails['user']['avatar']
  @pic = fuckrails['user']['avatar']
end

end
