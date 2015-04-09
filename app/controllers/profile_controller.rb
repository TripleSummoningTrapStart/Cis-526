class ProfileController < ApplicationController
  #def show
 #   @client = createClient()
  #  getActivites()
  #end

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
    #render :text => activity
    hello = @client.goals
    #render :text => activity['summary']['caloriesOut']
    render :text => hello['goals']['caloriesOut']
  end

end
