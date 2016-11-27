class Game < ActiveRecord::Base
	belongs_to :user_1, class_name: "User"
	belongs_to :user_2, class_name: "User"

	#def self.get_opponent(game, curr_user_name):
		#game.user_1.name if game.user_1.name != curr_user_name else game.user_2.name

end
