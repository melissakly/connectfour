class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :user1
      t.string :user2

      t.timestamps
    end
  end
end
