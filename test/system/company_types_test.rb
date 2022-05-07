require "application_system_test_case"

class CompanyTypesTest < ApplicationSystemTestCase
  setup do
    @company_type = company_types(:one)
  end

  test "visiting the index" do
    visit company_types_url
    assert_selector "h1", text: "Company Types"
  end

  test "creating a Company type" do
    visit company_types_url
    click_on "New Company Type"

    fill_in "Description", with: @company_type.description
    fill_in "Name", with: @company_type.name
    click_on "Create Company type"

    assert_text "Company type was successfully created"
    click_on "Back"
  end

  test "updating a Company type" do
    visit company_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @company_type.description
    fill_in "Name", with: @company_type.name
    click_on "Update Company type"

    assert_text "Company type was successfully updated"
    click_on "Back"
  end

  test "destroying a Company type" do
    visit company_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company type was successfully destroyed"
  end
end
