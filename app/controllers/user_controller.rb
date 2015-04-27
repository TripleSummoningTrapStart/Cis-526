class UserController < ApplicationController

  #used to show the users information from fitbit
  def show
  @client = createClient()
  getActivites()
end

#creates a user when requested too
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
  redirect_to user_show_path
end


#Destroys user session to logout
def destroy
  user = session[:user_id]
  if(user != nil)
    user = nil
  end
  flash[:notice] = 'Signed Out'
  redirect_to root_path
end

  #used to index users
  def index
    @users = User.all
  end


#opens a client to the fitbit server to grab user data
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

  #gets the activites from teh fitgem
def getActivites
  activity = @client.activities_on_date('today')
  userinfo = @client.user_info
  #render :text => activity
  goals = @client.goals
  #render :text => activity['summary']['caloriesOut']
 # render :text => hello['goals']['caloriesOut']
  #render :text => userinfo['user']['avatar']
  @pic = userinfo['user']['avatar']
  @name = userinfo['user']['fullName']
  @height = userinfo['user']['height']
  @weight = userinfo['user']['weight']
  @Steps = goals['goals']['steps']
  @Steps2 = activity['summary']['steps']
  @Cals = goals['goals']['caloriesOut']
  @Cals2 = activity['summary']['caloriesOut']
  @Dist = goals['goals']['distance']
  @Dist2 = activity['distance']
 # @height =  Float("%.#{0}g" % (@height/12))


end


end
