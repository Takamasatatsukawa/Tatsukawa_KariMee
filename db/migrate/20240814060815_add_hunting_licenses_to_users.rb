class AddHuntingLicensesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :net_hunting_license, :boolean
    add_column :users, :trap_hunting_license, :boolean
    add_column :users, :first_class_hunting_license, :boolean
    add_column :users, :second_class_hunting_license, :boolean
  end
end
