# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
100.times do
  Company.create(
    legal_name: FFaker::Company.name,
    sales_name: FFaker::Company.name,
    employees_number: rand(1..1000),
    cnpj: FFaker::IdentificationBR.cnpj,
    street: FFaker::AddressBR.street_name,
    number: rand(1..10000).to_s,
    compliment: FFaker::Address.secondary_address,
    neighborhood: FFaker::AddressBR.neighborhood,
    city: FFaker::AddressBR.city,
    state: FFaker::AddressBR.state_abbr,
    zip: FFaker::AddressBR.zip_code,
    country: 'Brasil',
    scope: FFaker::Company.catch_phrase,
    contact_name: FFaker::NameBR.name,
    contact_phone: FFaker::PhoneNumberBR.phone_number,
    contact_email: FFaker::Internet.email,
    contact_position: FFaker::JobBR.title
  )
end

