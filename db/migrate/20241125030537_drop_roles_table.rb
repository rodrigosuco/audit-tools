class DropRolesTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :roles
  end
end
