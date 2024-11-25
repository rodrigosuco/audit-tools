class RemoveStandardIdFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :standards_id, :integer
  end
end
