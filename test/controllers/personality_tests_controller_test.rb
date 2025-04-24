require "test_helper"

class PersonalityTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get personality_tests_new_url
    assert_response :success
  end

  test "should get create" do
    get personality_tests_create_url
    assert_response :success
  end

  test "should get show" do
    get personality_tests_show_url
    assert_response :success
  end
end
