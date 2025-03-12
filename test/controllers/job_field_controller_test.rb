require "test_helper"

class JobFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_field_index_url
    assert_response :success
  end

  test "should get info_tech" do
    get job_field_info_tech_url
    assert_response :success
  end

  test "should get Consul" do
    get job_field_Consul_url
    assert_response :success
  end
end
