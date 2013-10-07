require 'test_helper'

class TagDetailsControllerTest < ActionController::TestCase
  test "should get tag_navigator" do
    get :tag_details
    assert_response :success
  end
  
  #test "test 1" do
    #attributes = {
    #  :parameterName => "Linux"
    #}
    #@request.env['RAW_POST_DATA'] = attributes.to_json
    #post(:tag_details)
    #assert true
    
    #post :tag_details, :parameterName => 'Linux'
    
    #post :getWorkDetails, {rubyGroupTable => Project, dbGroupTable => 'projects', rubyTagAndGroupTable=>Projecttag, dbTagAndGroupTable=>'projecttags', tag=>'Linux'}
    
    #refute_nil($tagName)
    
    #refute_nil(@WorkCategoryWithTag)
  #end
end
