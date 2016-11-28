class AddLoseStreakToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :lstreak, :integer, default: 0
  end
end
