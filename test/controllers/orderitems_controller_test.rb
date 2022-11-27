require "test_helper"

class OrderitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get orderitems_create_url
    assert_response :success
  end
end
