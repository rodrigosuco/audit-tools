class AddProposalIdToItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :proposal, null: false, foreign_key: true
  end
end
