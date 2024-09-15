class CreateProposals < ActiveRecord::Migration[7.2]
  def change
    create_table :proposals do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
