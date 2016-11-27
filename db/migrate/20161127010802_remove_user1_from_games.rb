class RemoveUser1FromGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :user1, :string
  end
end
