class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :extra_data
      t.integer :frame_id
      t.timestamps
    end
  end
end
