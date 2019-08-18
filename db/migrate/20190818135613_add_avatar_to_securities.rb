class AddAvatarToSecurities < ActiveRecord::Migration[5.2]
  def change
    add_column :securities, :avatar, :string
  end
end
