require "test_helper"

class MakerFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maker_field_index_url
    assert_response :success
  end

  test "should get auto" do
    get maker_field_auto_url
    assert_response :success
  end
end
