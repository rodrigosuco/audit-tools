class AddEmployeesQuantitiyToCompany < ActiveRecord::Migration[7.2]
  def change
    add_column :companies, :employees_number, :integer
  end
end
