class Game < ActiveRecord::Base
	validates :user1, presence: true
	belongs_to :user

end
