class RemovePicturesFromSecurities < ActiveRecord::Migration[5.2]
  def change
    remove_column :securities, :picture
  end
end
