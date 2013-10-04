require 'test_helper'

class WorkCategoryContentControllerTest < ActionController::TestCase
  test "should get choose_work_category" do
    get :choose_work_category
    assert_response :success
  end

  test "should get display_work_category" do
    get :display_work_category
    assert_response :success
  end

end
