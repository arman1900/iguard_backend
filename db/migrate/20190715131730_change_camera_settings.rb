class ChangeCameraSettings < ActiveRecord::Migration[5.2]
  def change
    drop_table :camera_settings
  end
end
