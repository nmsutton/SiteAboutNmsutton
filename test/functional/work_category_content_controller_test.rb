require 'test_helper'

class WorkCategoryContentControllerTest < ActionController::TestCase
  test "should get choose_work_category" do
    get :choose_work_category
    assert_response :success
  end

  test "Check that a response is received successfully from accessing the projects page" do
    get "projects"
    assert_response(:success, "The projects page did not create a successful response when an
                     attempt was made to reach it")
  end
  
  test "Confirm unique tags group contains retreived content " do
    get :projects
    assert_not_nil(:UniqueTags)
  end
end
