require "test_helper"

class HuntersControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get hunters_list_url
    assert_response :success
  end
end
