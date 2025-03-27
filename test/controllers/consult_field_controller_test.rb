require "test_helper"

class ConsultFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consult_field_index_url
    assert_response :success
  end
end
