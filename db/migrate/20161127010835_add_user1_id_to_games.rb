class AddUser1IdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :user_1_id, :integer
  end
end
