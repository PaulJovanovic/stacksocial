class LogsController < ApplicationController

	before_filter :authenticate_user

	def index
		@logs = QueryLog.all
		respond_to do |format|
			format.html
		end
	end

end