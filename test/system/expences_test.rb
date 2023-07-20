require "application_system_test_case"

class ExpencesTest < ApplicationSystemTestCase
  setup do
    @expence = expences(:one)
  end

  test "visiting the index" do
    visit expences_url
    assert_selector "h1", text: "Expences"
  end

  test "should create expence" do
    visit expences_url
    click_on "New expence"

    fill_in "Amount", with: @expence.amount
    fill_in "Author", with: @expence.author_id
    fill_in "Name", with: @expence.name
    click_on "Create Expence"

    assert_text "Expence was successfully created"
    click_on "Back"
  end

  test "should update Expence" do
    visit expence_url(@expence)
    click_on "Edit this expence", match: :first

    fill_in "Amount", with: @expence.amount
    fill_in "Author", with: @expence.author_id
    fill_in "Name", with: @expence.name
    click_on "Update Expence"

    assert_text "Expence was successfully updated"
    click_on "Back"
  end

  test "should destroy Expence" do
    visit expence_url(@expence)
    click_on "Destroy this expence", match: :first

    assert_text "Expence was successfully destroyed"
  end
end
