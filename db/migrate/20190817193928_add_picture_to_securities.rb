class AddPictureToSecurities < ActiveRecord::Migration[5.2]
  def change
    add_column :securities, :picture, :string
  end
end
