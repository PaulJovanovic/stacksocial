class UsersController < ApplicationController

	before_filter :authenticate_user

	def show
		@twitter = Tweet.cache_user(params[:user])
		@tweets = Tweet.cache_timeline(params[:user])
		respond_to do |format|
      format.html
    end
	end
end