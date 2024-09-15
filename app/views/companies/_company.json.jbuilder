json.extract! company, :id, :legal_name, :sales_name, :cnpj, :street, :number, :compliment, :neighborhood, :city, :state, :country, :scope, :contact_name, :contact_phone, :contact_email, :created_at, :updated_at
json.url company_url(company, format: :json)
