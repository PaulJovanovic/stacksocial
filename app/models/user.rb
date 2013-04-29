class User < ActiveRecord::Base
  attr_accessible :name, :uid, :access_token, :access_secret
end
