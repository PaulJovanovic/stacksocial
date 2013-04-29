class HomesController < ApplicationController

	before_filter :authenticate_user

	def index
		search = params[:search] || session[:last_search] || "stacksocial"
		session[:last_search] = search

		@tweets = Rails.cache.fetch("search/#{search}") { 
			ql = QueryLog.new(:query => "@client.search('#{search}', :count => 20, :result_type => 'recent').results")
			ql.save
			@client.search("#{search}", :count => 20, :result_type => "recent").results
		}

		respond_to do |format|
      format.html
    end
	end

end