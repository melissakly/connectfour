class AddWinStreakToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :wstreak, :integer, default: 0
  end
end
