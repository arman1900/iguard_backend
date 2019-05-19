class CreateSecurities < ActiveRecord::Migration[5.2]
  def change
    create_table :securities do |t|
      t.string :company_name
      t.string :phone_number
      t.string :email
      t.string :telegram
      t.string :link
      t.text :extra_info
      t.string :location
      t.timestamps
    end
  end
end
