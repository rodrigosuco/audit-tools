class CreateJoinTableUsersStandards < ActiveRecord::Migration[7.2]
  def change
    create_join_table :users, :standards do |t|
       t.index [:user_id, :standard_id]
       t.index [:standard_id, :user_id]
    end
  end
end
