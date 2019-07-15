class ChangeCollumn < ActiveRecord::Migration[5.2]
  def change
    change_column :camera_settings, :status, :type, :default => "Off"
  end
end
