require "application_system_test_case"

class StandardsTest < ApplicationSystemTestCase
  setup do
    @standard = standards(:one)
  end

  test "visiting the index" do
    visit standards_url
    assert_selector "h1", text: "Standards"
  end

  test "should create standard" do
    visit standards_url
    click_on "New standard"

    fill_in "Name", with: @standard.name
    click_on "Create Standard"

    assert_text "Standard was successfully created"
    click_on "Back"
  end

  test "should update Standard" do
    visit standard_url(@standard)
    click_on "Edit this standard", match: :first

    fill_in "Name", with: @standard.name
    click_on "Update Standard"

    assert_text "Standard was successfully updated"
    click_on "Back"
  end

  test "should destroy Standard" do
    visit standard_url(@standard)
    click_on "Destroy this standard", match: :first

    assert_text "Standard was successfully destroyed"
  end
end
