class AddDetailsToTraps < ActiveRecord::Migration[7.1]
  def change
    add_column :traps, :trap_type, :string
    add_column :traps, :start_date, :date
    add_column :traps, :end_date, :date
  end
end
