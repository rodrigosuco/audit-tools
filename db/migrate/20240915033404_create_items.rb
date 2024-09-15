class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.references :standard, null: false, foreign_key: true
      t.string :stage
      t.integer :year
      t.float :onsite_man_days
      t.float :off_site_man_days
      t.float :man_day_rate
      t.float :total_cost

      t.timestamps
    end
  end
end
