require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get posts_add_url
    assert_response :success
  end

end
