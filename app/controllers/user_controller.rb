class UserController < ApplicationController
	def create
		name = params[:name]
		new_user = User.new(name: name)
		new_user.save!

		redirect_to '/'
	end

	def view
		@curr_user ||= User.find(session[:user_id]) if session[:user_id]
		@curr_user_name
		@games = Game.where(user_1: @curr_user).or(Game.where(user_2: @curr_user))
		#@opponents = games.map {|game| Game.get_opponent(game, @curr_user_name)}

		fb_token = @curr_user.oauth_token
		graph = Koala::Facebook::API.new(fb_token)
		@friends = graph.get_connections("me", "friends")
	end
end
