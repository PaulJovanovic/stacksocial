class Tweet < ActiveRecord::Base
	
	cattr_accessible :client

	def self.cache_search(key)
		Rails.cache.fetch('search/#{key}') { client.search("#{key}", :count => 20, :result_type => "recent").results }
	end

	def self.cache_timeline(key)
		Rails.cache.fetch('timeline/#{key}') { client.user_timeline(key) }
	end

	def self.cache_user(key)
		Rails.cache.fetch('users/#{key}') { client.user(key) }
	end

end
