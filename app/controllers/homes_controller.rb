class HomesController < ApplicationController

	before_filter :authenticate_user

	def index
		search = params[:search] || session[:last_search] || "stacksocial"
		session[:last_search] = search

		@tweets = Tweet.cache_search(search)

		respond_to do |format|
      format.html
    end
	end

end