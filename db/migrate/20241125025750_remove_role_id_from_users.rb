class RemoveRoleIdFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :role_id, :integer
  end
end
