class ChangeCameraSettingsDefualt < ActiveRecord::Migration[5.2]
  def change
    change_column :camera_settings, :status, :string, default: "Off"
  end
end
