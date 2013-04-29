class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
  	if session[:user]
  		@current_user = User.where(:id => session[:user]).last
			@client = Twitter::Client.new(
			  :consumer_key => "1xSceRGC87ky60OS2kN8Tg",
			  :consumer_secret => "w0w3tDhPP8lFkyBv5Prm2yoTWl9pOrV3eFsYnFDDY",
			  :oauth_token => @current_user.access_token,
			  :oauth_token_secret => @current_user.access_secret
			)
			Tweet.client = @client
		else
			redirect_to "/signin"
		end
  end
end
