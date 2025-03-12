require "test_helper"

class JobProcessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_process_index_url
    assert_response :success
  end

  test "should get es" do
    get job_process_es_url
    assert_response :success
  end

  test "should get network_test" do
    get job_process_network_test_url
    assert_response :success
  end

  test "should get gd" do
    get job_process_gd_url
    assert_response :success
  end

  test "should get interview" do
    get job_process_interview_url
    assert_response :success
  end

  test "should get offer" do
    get job_process_offer_url
    assert_response :success
  end
end
