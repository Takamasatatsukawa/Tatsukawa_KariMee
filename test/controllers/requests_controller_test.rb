require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get board" do
    get requests_board_url
    assert_response :success
  end
end
