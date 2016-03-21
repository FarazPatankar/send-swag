class TweetsController < ApplicationController
	def create
		user = User.find_by(id: current_user.id)
		sender = user.username.downcase
		username = params[:handle].downcase
		tweet = "Hey @#{username}, @#{sender} would like to send you swag."
	    @tweet = Tweet.new(:body => tweet)
	    @tweet.user_id = current_user.id
	    @tweet.sender = sender
	    @tweet.receiver = username
	    @tweet.save

	    redirect_to "/"
  	end
end
