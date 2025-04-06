require "test_helper"

class InsuranceFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get insurance_field_index_url
    assert_response :success
  end

  test "should get damage_insurance" do
    get insurance_field_damage_insurance_url
    assert_response :success
  end

  test "should get life_insurance" do
    get insurance_field_life_insurance_url
    assert_response :success
  end
end
