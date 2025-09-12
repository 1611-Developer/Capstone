class AddFieldToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    
    add_index :users, :username, unique: true
  end
end
