class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :surname
      t.string :second_name
      t.string :iin
      t.string :email
      t.string :telegram
      t.string :city
      t.string :street
      t.string :house
      t.string :apartment
      t.timestamps
    end
  end
end
