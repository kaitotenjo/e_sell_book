require "test_helper"

class CheckoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get checkouts_checkout_url
    assert_response :success
  end
end
