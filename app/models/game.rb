class Game < ActiveRecord::Base
	belongs_to :user_1, class_name: "User"
	belongs_to :user_2, class_name: "User"

	def play(col)
		matrix = eval(self.matrix)
		# set the current piece
		for i in 0..5
			k = 5 - i
			if matrix[k][col] == 0
				matrix[k][col] = self.curr_player
				break
			end
		end

		update! matrix: matrix

		if win?(self.curr_player)
			update! winner: self.curr_player == 1 ? user_1.name : user_2.name
		else
			# toggle between 1 and 2
			update! curr_player: 3 - self.curr_player
		end
	end

	def win?(player)
		matrix = eval(self.matrix)
		check = Array.new(6){Array.new(7, 0)}
		num = player

		#check for horizontal wins
		for row in 0..5
			for col in 0..3
				if matrix[row][col] == num and matrix[row][col+1] == num and matrix[row][col+2] == num and matrix[row][col+3] == num
					return true
				end
			end
		end

		#check for vertical wins
		for col in 0..6
			for row in 0..2
				if matrix[row][col] == num and matrix[row+1][col] == num and matrix[row+2][col] == num and matrix[row+3][col] == num
					return true
				end
			end
		end

		#check for \ wins 
		for row in 0..2
			for col in 0..3
				if matrix[row][col] == num and matrix[row+1][col+1] == num and matrix[row+2][col+2] == num and matrix[row+3][col+3] == num
					return true
				end
			end
		end			

		#check for / wins
		for row in 3..5
			for col in 0..3
				if matrix[row][col] == num and matrix[row-1][col+1] == num and matrix[row-2][col+2] == num and matrix[row-3][col+3] == num
					return true
				end
			end
		end	

		return false

	end

end
