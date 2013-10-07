require 'test_helper'

class WorkCategoryContentControllerTest < ActionController::TestCase
  test "should get choose_work_category" do
    get :choose_work_category
    assert_response :success
  end
  
  test "Confirm unique tags group contains retreived content " do
    get :projects
    assert_not_nil(:UniqueTags)
  end
end
