class AddLossesToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :losses, :integer, default: 0
  end
end
