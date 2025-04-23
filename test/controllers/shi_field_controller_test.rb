require "test_helper"

class ShiFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shi_field_index_url
    assert_response :success
  end
end
