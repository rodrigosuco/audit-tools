require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference("Company.count") do
      post companies_url, params: { company: { city: @company.city, cnpj: @company.cnpj, compliment: @company.compliment, contact_email: @company.contact_email, contact_name: @company.contact_name, contact_phone: @company.contact_phone, country: @company.country, legal_name: @company.legal_name, neighborhood: @company.neighborhood, number: @company.number, sales_name: @company.sales_name, scope: @company.scope, state: @company.state, street: @company.street } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { city: @company.city, cnpj: @company.cnpj, compliment: @company.compliment, contact_email: @company.contact_email, contact_name: @company.contact_name, contact_phone: @company.contact_phone, country: @company.country, legal_name: @company.legal_name, neighborhood: @company.neighborhood, number: @company.number, sales_name: @company.sales_name, scope: @company.scope, state: @company.state, street: @company.street } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference("Company.count", -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
