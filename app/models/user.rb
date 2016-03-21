class User < ActiveRecord::Base
	def self.find_or_create_from_auth_hash(auth_hash)
		user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
		user.update(
			username: auth_hash.info.nickname,
			profile_image: auth_hash.info.image,
			token: auth_hash.credentials.token,
			secret: auth_hash.credentials.secret
		)
		user
	end

	def twitter
	    @client ||= Twitter::REST::Client.new do |config|
	      config.consumer_key        = ENV['twitter_api_key']
	      config.consumer_secret     = ENV['twitter_api_secret']
	      config.access_token        = ENV['twitter_access_token']
	      config.access_token_secret = ENV['twitter_access_token_secret']
    	end
    end
end
