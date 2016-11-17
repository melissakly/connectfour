class GameController < ApplicationController
	def create
		user1 = User.where(name: params[:user1]).first
		user2 = User.where(name: params[:user2]).first
		game = Game.new(user1: user1, user2: user2)
		game.save!

		redirect_to user_path, :user => user1
	end

	def view
		@user1 = params[:user1]
		@user2 = params[:user2]
		@status = params[:status]
	end
end