require "application_system_test_case"

class UserCategoriesTest < ApplicationSystemTestCase
  setup do
    @user_category = user_categories(:one)
  end

  test "visiting the index" do
    visit user_categories_url
    assert_selector "h1", text: "User Categories"
  end

  test "creating a User category" do
    visit user_categories_url
    click_on "New User Category"

    fill_in "Description", with: @user_category.description
    fill_in "Name", with: @user_category.name
    click_on "Create User category"

    assert_text "User category was successfully created"
    click_on "Back"
  end

  test "updating a User category" do
    visit user_categories_url
    click_on "Edit", match: :first

    fill_in "Description", with: @user_category.description
    fill_in "Name", with: @user_category.name
    click_on "Update User category"

    assert_text "User category was successfully updated"
    click_on "Back"
  end

  test "destroying a User category" do
    visit user_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User category was successfully destroyed"
  end
end
