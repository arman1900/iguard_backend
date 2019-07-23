class AddPictureToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :picture, :string
  end
end
