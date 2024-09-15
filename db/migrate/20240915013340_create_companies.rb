class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :legal_name
      t.string :sales_name
      t.string :cnpj
      t.string :street
      t.integer :number
      t.string :compliment
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country
      t.text :scope
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
