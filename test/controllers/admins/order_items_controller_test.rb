require "test_helper"

class Admins::OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_order_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_order_items_update_url
    assert_response :success
  end

  test "should get delete" do
    get admins_order_items_delete_url
    assert_response :success
  end
end
