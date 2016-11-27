class AddCurrPlayerToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :curr_player, :integer, default: 1
  end
end
