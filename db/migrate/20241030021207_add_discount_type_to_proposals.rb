class AddDiscountTypeToProposals < ActiveRecord::Migration[7.2]
  def change
    add_column :proposals, :discount_type, :string
  end
end
