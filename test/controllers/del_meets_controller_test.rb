require 'test_helper'

class DelMeetsControllerTest < ActionDispatch::IntegrationTest
  test "should get weirdName" do
    get del_meets_weirdName_url
    assert_response :success
  end

  test "should get deleteMeets" do
    get del_meets_deleteMeets_url
    assert_response :success
  end

end
