class ChangeNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :camera_id, :string
  end
end
