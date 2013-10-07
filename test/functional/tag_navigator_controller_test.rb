require 'test_helper'

class TagNavigatorControllerTest < ActionController::TestCase
  test "should get tag_navigator" do
    get :tag_navigator
    assert_response :success
  end

  test "Unique tag categories are availible" do
    get :tag_navigator
    
    assert_not_nil(assigns(:UniqueTagCategories), "Unique tag categories were found to be nil when a group of them was expected")
  end
  
  test "Group of tags with categories was found to not be nil" do
    get :tag_navigator
    
    assert_not_nil(assigns(:TagCategoryList), "Group of tags with categories was found to be nil when content was expected in the group")
  end
end
