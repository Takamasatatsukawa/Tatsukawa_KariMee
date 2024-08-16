class AddUserIdToTraps < ActiveRecord::Migration[7.1]
  def change
    add_column :traps, :user_id, :integer
  end
end
