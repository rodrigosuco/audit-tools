class AddProposalTotalCostToProposals < ActiveRecord::Migration[7.2]
  def change
    add_column :proposals, :total_cost, :float
  end
end
