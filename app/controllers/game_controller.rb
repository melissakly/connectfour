class GameController < ApplicationController
	def create
		puts params[:user1]
		puts params[:user2]
		user1 = User.where(name: params[:user1]).first

		if User.exists?(name: params[:user2])
			user2 = User.where(name: params[:user2]).first
		else
			user2 = User.create(name: params[:user2])
		end

		game = Game.new(user_1: user1, user_2: user2)
		game.save!

		redirect_to user_path(user: user1)
	end

	def view
		@curr_user ||= User.find(session[:user_id]) if session[:user_id]
		@config = {
			1 => "yel",
			2 => "red",
			0 => "nan"
		}
		@game_id = params[:game]
		game = Game.find(@game_id)
		@user1 = User.find(game.user_1).name
		@user2 = User.find(game.user_2).name
		@curr_player = game.curr_player
		@board = eval(game.matrix)
		@can_move = game.curr_player == 1 && @curr_user.name == @user1 ||
					game.curr_player == 2 && @curr_user.name == @user2
		@winner = game.winner
	end

	def play
		game = Game.find(params[:game])
		col = params[:column].to_i
		game.play(col)

		redirect_to game_path(game: params[:game])
	end
end

