require "test_helper"

class Admins::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = admins_products(:one)
  end

  test "should get index" do
    get admins_products_url
    assert_response :success
  end

  test "should get new" do
    get new_admins_product_url
    assert_response :success
  end

  test "should create admins_product" do
    assert_difference("Admins::Product.count") do
      post admins_products_url, params: { admins_product: {  } }
    end

    assert_redirected_to admins_product_url(Admins::Product.last)
  end

  test "should show admins_product" do
    get admins_product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_admins_product_url(@product)
    assert_response :success
  end

  test "should update admins_product" do
    patch admins_product_url(@product), params: { admins_product: {  } }
    assert_redirected_to admins_product_url(@product)
  end

  test "should destroy admins_product" do
    assert_difference("Admins::Product.count", -1) do
      delete admins_product_url(@product)
    end

    assert_redirected_to admins_products_url
  end
end
