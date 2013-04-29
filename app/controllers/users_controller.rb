class UsersController < ApplicationController

	before_filter :authenticate_user

	def show
		@twitter = @client.user(params[:user])
		@tweets = @client.user_timeline(params[:user])
		respond_to do |format|
      format.html
    end
	end
end