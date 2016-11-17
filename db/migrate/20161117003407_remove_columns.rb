class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
  end

  def self.up
  	remove_column :games, :user1
  	remove_column :games, :user2
  end
end
