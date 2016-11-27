class RemoveUser2FromGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :user2, :string
  end
end
