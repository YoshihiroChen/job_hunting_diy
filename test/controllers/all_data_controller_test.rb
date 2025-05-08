require "test_helper"

class AllDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_data_index_url
    assert_response :success
  end
end
