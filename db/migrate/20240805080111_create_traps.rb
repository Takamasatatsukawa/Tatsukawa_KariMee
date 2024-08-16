class CreateTraps < ActiveRecord::Migration[7.1]
  def change
    create_table :traps do |t|
      t.float :lat
      t.float :lng

      t.timestamps
    end

    add_index :traps, [:lat, :lng], unique: true
  end
end
