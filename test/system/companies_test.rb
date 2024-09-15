require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit companies_url
    click_on "New company"

    fill_in "City", with: @company.city
    fill_in "Cnpj", with: @company.cnpj
    fill_in "Compliment", with: @company.compliment
    fill_in "Contact email", with: @company.contact_email
    fill_in "Contact name", with: @company.contact_name
    fill_in "Contact phone", with: @company.contact_phone
    fill_in "Country", with: @company.country
    fill_in "Legal name", with: @company.legal_name
    fill_in "Neighborhood", with: @company.neighborhood
    fill_in "Number", with: @company.number
    fill_in "Sales name", with: @company.sales_name
    fill_in "Scope", with: @company.scope
    fill_in "State", with: @company.state
    fill_in "Street", with: @company.street
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit company_url(@company)
    click_on "Edit this company", match: :first

    fill_in "City", with: @company.city
    fill_in "Cnpj", with: @company.cnpj
    fill_in "Compliment", with: @company.compliment
    fill_in "Contact email", with: @company.contact_email
    fill_in "Contact name", with: @company.contact_name
    fill_in "Contact phone", with: @company.contact_phone
    fill_in "Country", with: @company.country
    fill_in "Legal name", with: @company.legal_name
    fill_in "Neighborhood", with: @company.neighborhood
    fill_in "Number", with: @company.number
    fill_in "Sales name", with: @company.sales_name
    fill_in "Scope", with: @company.scope
    fill_in "State", with: @company.state
    fill_in "Street", with: @company.street
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit company_url(@company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
