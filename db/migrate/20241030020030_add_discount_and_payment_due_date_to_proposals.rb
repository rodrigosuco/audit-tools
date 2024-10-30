class AddDiscountAndPaymentDueDateToProposals < ActiveRecord::Migration[7.2]
  def change
    add_column :proposals, :due_date, :integer
    add_column :proposals, :discount, :float
  end
end
