require "test_helper"

class SyosyaFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get syosya_field_index_url
    assert_response :success
  end

  test "should get sougou_syosya" do
    get syosya_field_sougou_syosya_url
    assert_response :success
  end

  test "should get senmon_syosya" do
    get syosya_field_senmon_syosya_url
    assert_response :success
  end
end
