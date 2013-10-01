require 'test_helper'

class TagNavigatorControllerTest < ActionController::TestCase
  test "should get tag_navigator" do
    get :tag_navigator
    assert_response :success
  end

end
