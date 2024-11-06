class AddStartAndEntTimeToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :start_time, :datetime
    add_column :items, :end_time, :datetime
  end
end
