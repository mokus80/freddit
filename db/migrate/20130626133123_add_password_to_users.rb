class AddPasswordToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :password, :string
  	add_index :users, :password
  end
end
