require "test_helper"

class InfoCollectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get info_collection_index_url
    assert_response :success
  end

  test "should get foreign_company" do
    get info_collection_foreign_company_url
    assert_response :success
  end

  test "should get rikunavi" do
    get info_collection_rikunavi_url
    assert_response :success
  end

  test "should get openwork" do
    get info_collection_openwork_url
    assert_response :success
  end

  test "should get onecareer" do
    get info_collection_onecareer_url
    assert_response :success
  end

  test "should get mynavi" do
    get info_collection_mynavi_url
    assert_response :success
  end

  test "should get social_media" do
    get info_collection_social_media_url
    assert_response :success
  end

  test "should get npo" do
    get info_collection_npo_url
    assert_response :success
  end
end
