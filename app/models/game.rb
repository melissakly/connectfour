class Game < ActiveRecord::Base
	belongs_to :user_1, class_name: "User"
	belongs_to :user_2, class_name: "User"

	validates :user_2, uniqueness: { scope: :user_1 }

end
