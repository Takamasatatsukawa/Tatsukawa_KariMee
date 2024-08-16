require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get events_info_url
    assert_response :success
  end
end
