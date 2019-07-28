class AddUserIdToCameraSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :camera_settings, :user_id, :integer
    add_index :camera_settings, :user_id
  end
end
