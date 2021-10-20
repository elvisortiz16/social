require 'test_helper'

class UserFriendControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get user_friend_add_url
    assert_response :success
  end

end
