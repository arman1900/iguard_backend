class CreateJoinTableUserSecurity < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :securities do |t|
       t.index [:user_id, :security_id]
      # t.index [:security_id, :user_id]
    end
  end
end
