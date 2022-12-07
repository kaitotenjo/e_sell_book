require "application_system_test_case"

class Admins::OrdersTest < ApplicationSystemTestCase
  setup do
    @admins_order = admins_orders(:one)
  end

  test "visiting the index" do
    visit admins_orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit admins_orders_url
    click_on "New order"

    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit admins_order_url(@admins_order)
    click_on "Edit this order", match: :first

    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit admins_order_url(@admins_order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
