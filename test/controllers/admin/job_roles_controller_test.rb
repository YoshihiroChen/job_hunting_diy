require "test_helper"

class Admin::JobRolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_job_roles_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_job_roles_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_job_roles_update_url
    assert_response :success
  end
end
