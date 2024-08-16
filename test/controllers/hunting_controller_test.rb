require "test_helper"

class HuntingControllerTest < ActionDispatch::IntegrationTest
  test "should get map" do
    get hunting_map_url
    assert_response :success
  end

  test "should get info" do
    get hunting_info_url
    assert_response :success
  end
end
