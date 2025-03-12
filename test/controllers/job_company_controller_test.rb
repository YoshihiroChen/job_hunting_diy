require "test_helper"

class JobCompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_company_index_url
    assert_response :success
  end
end
