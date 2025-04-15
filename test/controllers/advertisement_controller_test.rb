require "test_helper"

class AdvertisementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get advertisement_index_url
    assert_response :success
  end

  test "should get agency" do
    get advertisement_agency_url
    assert_response :success
  end
end
