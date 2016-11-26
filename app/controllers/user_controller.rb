class UserController < ApplicationController
	def create
		name = params[:name]
		new_user = User.new(name: name)
		new_user.save!

		redirect_to '/'
	end

	def view
		@curr_user ||= User.find(session[:user_id]) if session[:user_id]
		@games = Game.where(user1: @curr_user).or(Game.where(user2: @curr_user))
	end
end
