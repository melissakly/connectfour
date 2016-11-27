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
		@status = game.status
		@board = eval(game.matrix)
		@can_move = @status == 'Player 1’s turn' && @curr_user.name == @user1 ||
					@status == 'Player 2’s turn' && @curr_user.name == @user2
	end

	def play
		game = Game.find(params[:game])
		is_curr_player_1 = game.status == 'Player 1’s turn'
		matrix = eval(game.matrix)
		col = params[:column].to_i
		
		# set the current piece
		for i in 0..5
			k = 5 - i
			if matrix[k][col] == 0
				if is_curr_player_1
					matrix[k][col] = 1
				else
					matrix[k][col] = 2
				end
				break
			end
		end

		game.update_attribute(:matrix, matrix.to_s)
		if is_curr_player_1
			game.update_attribute(:status, 'Player 2’s turn')
		else
			game.update_attribute(:status, 'Player 1’s turn')
		end

		redirect_to game_path(game: params[:game])
	end
end

