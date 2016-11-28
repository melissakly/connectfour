# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :string           default("Player 1’s turn")
#  matrix      :string           default("[[0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0]]")
#  user_1_id   :integer
#  user_2_id   :integer
#  curr_player :integer          default(1)
#  winner      :string
#

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
			if self.curr_player == 1
				victory(user_1)
				defeat(user_2)	
			else
				victory(user_2)
				defeat(user_1)
			end
		else
			# toggle between 1 and 2
			update! curr_player: 3 - self.curr_player
		end
	end

	def victory(player)
		if Badge.exists?(user: player)
			badge = Badge.where(user: player).first
			badge.wins = badge.wins + 1
			badge.save!
		else
			new_badge = Badge.new(user: player)
			new_badge.wins = new_badge.wins + 1
			new_badge.save!
		end
	end

	def defeat(player)
		if Badge.exists?(user: player)
			badge = Badge.where(user: player).first
			badge.losses = badge.losses + 1
			badge.save!
		else
			new_badge = Badge.new(user: player)
			new_badge.losses = new_badge.losses + 1
			new_badge.save!
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
