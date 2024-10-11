class AddZipToCompany < ActiveRecord::Migration[7.2]
  def change
    add_column :companies, :zip, :string
  end
end
