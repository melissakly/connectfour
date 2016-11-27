class Game < ActiveRecord::Base
	belongs_to :user_1, class_name: "User"
	belongs_to :user_2, class_name: "User"

	#def self.get_opponent(game, curr_user_name):
		#game.user_1.name if game.user_1.name != curr_user_name else game.user_2.name

	attr_accessor :matrix

	def win?(player)
		matrix = eval(:matrix)
		check = Array.new(6){Array.new(7, 0)}
		num = player

		#check for horizontal wins
		for row in 0..5
			for col in 0..4
				if matrix[row][col] == num and matrix[row][col+1] == num and matrix[row][col+2] == num and matrix[row][col+3] == num
					return true
				end
			end
		end

		#check for vertical wins
		for col in 0..6
			for row in 0..3
				if matrix[row][col] == num and matrix[row+1][col] == num and matrix[row+2][col] == num and matrix[row+3][col] == num
					return true
				end
			end
		end

		#check for \ wins 
		for row in 0..3
			for col in 0..4
				if matrix[row][col] == num and matrix[row+1][col+1] == num and matrix[row+2][col+2] == num and matrix[row+3][col+3] == num
					return true
				end
			end
		end			

		#check for / wins
		for row in 3..6
			for col in 0..4
				if matrix[row][col] == num and matrix[row-1][col+1] == num and matrix[row-2][col+2] == num and matrix[row-3][col+3] == num
					return true
				end
			end
		end	

		return false

	end

end
