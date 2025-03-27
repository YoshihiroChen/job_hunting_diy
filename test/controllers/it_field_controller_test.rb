require "test_helper"

class ItFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get it_field_index_url
    assert_response :success
  end
end
