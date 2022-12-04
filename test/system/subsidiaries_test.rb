require "application_system_test_case"

class SubsidiariesTest < ApplicationSystemTestCase
  setup do
    @subsidiary = subsidiaries(:one)
  end

  test "visiting the index" do
    visit subsidiaries_url
    assert_selector "h1", text: "Subsidiaries"
  end

  test "should create subsidiary" do
    visit subsidiaries_url
    click_on "New subsidiary"

    fill_in "Address", with: @subsidiary.address
    fill_in "Name", with: @subsidiary.name
    fill_in "Phone number", with: @subsidiary.phone_number
    click_on "Create Subsidiary"

    assert_text "Subsidiary was successfully created"
    click_on "Back"
  end

  test "should update Subsidiary" do
    visit subsidiary_url(@subsidiary)
    click_on "Edit this subsidiary", match: :first

    fill_in "Address", with: @subsidiary.address
    fill_in "Name", with: @subsidiary.name
    fill_in "Phone number", with: @subsidiary.phone_number
    click_on "Update Subsidiary"

    assert_text "Subsidiary was successfully updated"
    click_on "Back"
  end

  test "should destroy Subsidiary" do
    visit subsidiary_url(@subsidiary)
    click_on "Destroy this subsidiary", match: :first

    assert_text "Subsidiary was successfully destroyed"
  end
end
