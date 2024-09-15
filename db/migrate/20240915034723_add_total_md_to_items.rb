class AddTotalMdToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :total_days, :float
  end
end
