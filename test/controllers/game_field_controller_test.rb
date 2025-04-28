require "test_helper"

class GameFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_field_index_url
    assert_response :success
  end

  test "should get console" do
    get game_field_console_url
    assert_response :success
  end

  test "should get webs" do
    get game_field_webs_url
    assert_response :success
  end
end
