require "test_helper"

class RetailFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get retail_field_index_url
    assert_response :success
  end

  test "should get super" do
    get retail_field_super_url
    assert_response :success
  end

  test "should get transport" do
    get retail_field_transport_url
    assert_response :success
  end

  test "should get wholesale" do
    get retail_field_wholesale_url
    assert_response :success
  end
end
