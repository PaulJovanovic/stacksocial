class SessionsController < ApplicationController

	def create
		unless session[:user]
	  	auth = request.env["omniauth.auth"]
		  user = User.new do |u|
				u.name = auth["info"]["nickname"]
				u.uid = auth["uid"]
			  u.access_token = auth["credentials"]["token"]
			  u.access_secret = auth["credentials"]["secret"]
			end
			if user.save
				session[:user] = user.id
			end
		end
	  redirect_to root_path
	end

	def destroy
		session[:user] = nil
	  redirect_to root_path
	end

	def signin
		respond_to do |format|
			format.html
		end
	end

end