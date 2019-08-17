class ChangeTypeOfCameraId < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications, :camera_id, 'integer USING CAST(camera_id AS integer)'
  end
end
