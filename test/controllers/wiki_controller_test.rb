require "test_helper"

class WikiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wiki_index_url
    assert_response :success
  end
end
