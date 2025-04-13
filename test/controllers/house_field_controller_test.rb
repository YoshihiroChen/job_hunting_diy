require "test_helper"

class HouseFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get house_field_index_url
    assert_response :success
  end

  test "should get developer" do
    get house_field_developer_url
    assert_response :success
  end

  test "should get management" do
    get house_field_management_url
    assert_response :success
  end

  test "should get advisor" do
    get house_field_advisor_url
    assert_response :success
  end

  test "should get rent" do
    get house_field_rent_url
    assert_response :success
  end
end
