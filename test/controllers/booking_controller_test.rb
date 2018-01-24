require 'test_helper'

class BookingControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post booking_create_url
    assert_response :success
  end

end
