class AddCreatedByToProposals < ActiveRecord::Migration[7.2]
  def change
    add_reference :proposals, :user, null: true, foreign_key: true
  end
end
