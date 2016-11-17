class UserController < ApplicationController
	def create
		name = params[:name]
		new_user = User.new(name: name)
		new_user.save!

		redirect_to '/'
	end

	def view
		@curr_user = params[:user]
		@games = Game.where(user1: @curr_user)
	end
end
