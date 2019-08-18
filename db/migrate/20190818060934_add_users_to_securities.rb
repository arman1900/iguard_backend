class AddUsersToSecurities < ActiveRecord::Migration[5.2]
  def change
    create_table :users_securities, id: false do |t|
      t.belongs_to :user
      t.belongs_to :security
    end
  end
end
