class AddPasswordConfirmationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :password_confirmation, :string
  	add_index :users, :password_confirmation
  end
end
