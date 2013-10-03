require 'test_helper'

class TagDetailsControllerTest < ActionController::TestCase
  test "should get tag_details" do
    get :tag_details
    assert_response :success
  end

end
