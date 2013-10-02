require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get projects" do
    get :projects
    assert_response :success
  end

end
