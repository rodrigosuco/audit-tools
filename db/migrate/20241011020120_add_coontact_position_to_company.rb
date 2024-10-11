class AddCoontactPositionToCompany < ActiveRecord::Migration[7.2]
  def change
    add_column :companies, :contact_position, :string
  end
end
