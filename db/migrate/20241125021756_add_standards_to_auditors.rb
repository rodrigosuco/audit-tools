class AddStandardsToAuditors < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :standards, null: true, foreign_key: true
  end
end
