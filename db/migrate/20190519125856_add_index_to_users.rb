class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :phone_number
    add_index :users, :email
    add_index :developers, :token, unique: true
  end
end
