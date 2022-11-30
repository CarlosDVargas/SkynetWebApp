require "application_system_test_case"

class OperationsTest < ApplicationSystemTestCase
  setup do
    @operation = operations(:one)
  end

  test "visiting the index" do
    visit operations_url
    assert_selector "h1", text: "Operations"
  end

  test "should create operation" do
    visit operations_url
    click_on "New operation"

    click_on "Create Operation"

    assert_text "Operation was successfully created"
    click_on "Back"
  end

  test "should update Operation" do
    visit operation_url(@operation)
    click_on "Edit this operation", match: :first

    click_on "Update Operation"

    assert_text "Operation was successfully updated"
    click_on "Back"
  end

  test "should destroy Operation" do
    visit operation_url(@operation)
    click_on "Destroy this operation", match: :first

    assert_text "Operation was successfully destroyed"
  end
end
