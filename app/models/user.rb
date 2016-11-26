require 'koala'

class User < ActiveRecord::Base
	has_many :games

	def self.from_omniauth(auth)
		graph = Koala::Facebook::API.new(auth.credentials.token)
    	friends = graph.get_connections("me", "friends")

   		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    	user.provider = auth.provider
	    	user.uid = auth.uid
	    	user.name = auth.info.name
	    	user.oauth_token = auth.credentials.token
	    	user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    	user.save!
    	end	
  	end
end
