require 'test_helper'

class TagNavigatorControllerTest < ActionController::TestCase
  test "should get tag_navigator" do
    get :tag_navigator
    assert_response :success
  end

  test "tag categories are availible" do
    get :tag_navigator
    
    assert_not_nil assigns(:UniqueTagCategories)
    #refute_nil(@UniqueTagCategories, "tag categories are availible")
  end
  
  test "tags with categories were found" do
    get :tag_navigator
    
    assert_not_nil assigns(:TagCategoryList)
    #refute_nil(@TagCategoryList, "tags in categories are found")
  end
end
