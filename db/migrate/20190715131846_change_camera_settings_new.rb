class ChangeCameraSettingsNew < ActiveRecord::Migration[5.2]
  def change
    create_table :camera_settings do |t|
      t.string :status
      t.string :on_time
      t.string :on_day
      t.string :off_time
      t.timestamps
    end
  end
end
