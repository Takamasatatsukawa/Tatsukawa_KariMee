class AddContactInformationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :contact_information, :string
  end
end
