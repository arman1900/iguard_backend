class ChangeTypeOfNotificationscameraId < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications, :camera_id, :integer
  end
end
