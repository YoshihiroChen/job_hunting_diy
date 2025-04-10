require "test_helper"

class BankFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_field_index_url
    assert_response :success
  end

  test "should get commercial_bank" do
    get bank_field_commercial_bank_url
    assert_response :success
  end

  test "should get investment_bank" do
    get bank_field_investment_bank_url
    assert_response :success
  end

  test "should get trust_bank" do
    get bank_field_trust_bank_url
    assert_response :success
  end

  test "should get retail_bank" do
    get bank_field_retail_bank_url
    assert_response :success
  end

  test "should get internet_bank" do
    get bank_field_internet_bank_url
    assert_response :success
  end

  test "should get other_bank" do
    get bank_field_other_bank_url
    assert_response :success
  end
end
