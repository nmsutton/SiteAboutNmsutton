require 'test_helper'

class WelcomePageControllerTest < ActionController::TestCase
  test "should get welcome_page" do
    get :welcome_page
    assert_response :success
  end

end
