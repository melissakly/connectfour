class AddUserIdToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :user_id, :integer
  end
end
