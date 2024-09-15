class CreateStandards < ActiveRecord::Migration[7.2]
  def change
    create_table :standards do |t|
      t.string :name

      t.timestamps
    end
  end
end
