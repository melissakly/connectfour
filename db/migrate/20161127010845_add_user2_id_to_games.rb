class AddUser2IdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :user_2_id, :integer
  end
end
