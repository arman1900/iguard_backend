class AddIndexLoginToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :login
  end
end
