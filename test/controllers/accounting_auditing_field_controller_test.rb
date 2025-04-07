require "test_helper"

class AccountingAuditingFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounting_auditing_field_index_url
    assert_response :success
  end

  test "should get accounting" do
    get accounting_auditing_field_accounting_url
    assert_response :success
  end

  test "should get auditing" do
    get accounting_auditing_field_auditing_url
    assert_response :success
  end
end
