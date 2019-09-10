class AddCameraNameToCameraSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :camera_settings, :camera_name, :string
    add_index :camera_settings, :camera_name
  end
end
