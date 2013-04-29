class UsersController < ApplicationController

	before_filter :authenticate_user

	def show
		@twitter = Rails.cache.fetch("users/#{params[:user]}") { 
			@client.user(params[:user]) 
			ql = QueryLog.new(:query => "@client.user(#{params[:user]})")
			ql.save
		}
		@tweets = Rails.cache.fetch("timeline/#{params[:user]}") { 
			@client.user_timeline(params[:user]) 
			ql = QueryLog.new(:query => "@client.user_timeline(#{params[:user]})")
			ql.save
		}
		respond_to do |format|
      format.html
    end
	end
end