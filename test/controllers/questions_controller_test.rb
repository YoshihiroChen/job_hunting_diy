require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questions_index_url
    assert_response :success
  end

  test "should get mathematics" do
    get questions_mathematics_url
    assert_response :success
  end

  test "should get salaries" do
    get questions_salaries_url
    assert_response :success
  end
end
